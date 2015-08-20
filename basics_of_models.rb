# =>                                    MODELS

=begin

    Models - are the way we communicate with our data

=end

# when we make a query to find the player number 1 in our database

    a = Player.find(1)

    # It was able to find the player one because of the MODEL

    #in our Rails App, we can find the model by following this path: app/models/player.rb
    #   If you notices is singular, not plural

    class Player < ActiveRecord::Base
    end

    # In our query (line 9), we call

        Player       # <-- Player reference  the Player Model in line 16

    #Since the Model inherits form

        ActiveRecord::Base

    #ActiveRecord::Base  maps the Model to the database table, which has the name players, lowecase and plural as we see in line 31-44

=begin
     ** Our table is called 'players'

                    id                      player                      position                   number               <----Columns (Left to right)
             ______________________________________________________________________________________________________
            I    1            I           C.Ronaldo          I             Left-Wing          I         7          I
            I------------------------------------------------------------------------------------------------------I
            I    2            I           Navas              I             Keeper             I         1          I
            I------------------------------------------------------------------------------------------------------I
            I    3            I           Bale               I             Right-Wing         I         5          I
            |------------------------------------------------------------------------------------------------------I
            I    4            I           J. Mata           I            Mid-fielder           I        14         I
            I______________________________________________________________________________________________________I
=end

    #Back to the query

    Player.find(1)  #<-- We call the Player class, looks for the database table, then looks for the id = (1)

    #after we make the query we get back the Intance of the Class, which is the same as the Instance of  Player  with id = 3. This Instance of the Class
    # will be store in " a " variable
     a = Player.find(1)


#                               VALIDATIONS

    # If we  do this...
        a = Player.save
        a.save

    #Noticed we saved a Player without a name, position, number. WE DON'T WANT THAT

    # Let's go to out Player Model and let's do Magic

    class Player < ActiveRecord::Base
        validates_precense_of :player, :position, :number  #<-- here you can pass the columns(attributes) of your databse
    end

    #When we use the Rails Console create a new player.

    a = Player.new
    a.save

    #This will return false, because we set a validation. (here Im just going do :player, to explain)
    # If you want to know what went wrong, you can user this in the Rails Console

    a.errors.messages   #<-- you will get a hash with the values and  message of what you did wrong
    {player: ["You need a player"]}   #<-- I made up this message, but you get a hash in return.

    # If you want to print the message only.
    a.errors[:player][0]  #<-- this will return only the first message
    "You need a player"    #<-- I just made this up, but you will get the message

#There are many Validation you can use

    validates_precense_of :player
    validates_numericality_of :numbers #<- to make sure something is a number
    validetates_uniqueness_of :positions #<-to make something is unique
    validates_confirmation_of :age #<- if we have 2 fields for age that need to be equal
    validates_acceptance_of :experience #<- if the have to meet any specific years of experience
    validates_length_of :phone_number, minimum: 5 #<- will check if the the number has more than 5 digits
    validates_format_of :email, with: /regex/i #<- if we want to specified how an email needs to be formatted, to be accepeted
    validates_inclusion_of :age, in: 20..36 #<-- to make sure age is between 20..36
    validates_exclusione_of :age, in: 10..16, message: "Need to be older" #<-- to make sure ages is not in between 10-16

# We can write Validations simpler than above.

    validates :player, presence: true
    validates :player, length: {minimum: 1}

    # We can combine the validations above.

    validates :status,
                    presence: true,
                    length: {minimum: 1}

#Other short Validations

    validates :player,
                    uniqueness: true,
                    numericality: true,
                    length: {minimum: 0, maximum: 20 },
                    format: {with: /regexp/i },
                    acceptance: true,
                    confirmation: true


#                   DATABASE RELATIONSHIP

    # In Rails we will would have many tables, so we have to find a way to connect them together.

    # Let's make the Position column from our database in line 31-44 to have its own table.

=begin
     ** Our table is called 'players'

                    id                      player               number               <----Columns (Left to right)
             _______________________________________________________________
            I    1            I           C.Ronaldo     I         7         I    <--Look at the ' positons ' table, this player can play multiple positions
            I---------------------------------------------------------------I
            I    2            I           Navas         I         1         I
            I---------------------------------------------------------------I
            I    3            I           Bale          I         5         I
            |---------------------------------------------------------------I
            I    4            I           J. Mata       I        14         I
            I_______________________________________________________________I
=end

=begin

#Our table is ' position '

     ** Our table is called 'position'

                    id                      position                  player_id              <----Columns (Left to right)
             _______________________________________________________________________
            I    1            I             Left-Wing          I         1          I
            I-----------------------------------------------------------------------I
            I    2            I             Keeper             I         2          I
            I-----------------------------------------------------------------------I
            I    3            I             Right-Wing         I         1          I   <-- Notice that player with id = 1 can play two positions
            |-----------------------------------------------------------------------I
            I    4            I           Mid-fielder          I        4           I
            I_______________________________________________________________________I
=end


    #Now we have to find a way to tell Rails that this two tables (line 124- 155) have a relationship

    # We know that each table has to have its own Model

    #In each Model, that where Love Happens

    #This is how we make a RELATIONSHIP between two tables.

        # Player Model

                class Player < ActiveRecord::Base
                    has_many :positions   #<- set positons as pural because Player can play many positions
                end

        # Position Model
                class Position < ActiveRecord::Base
                    belongs_to :player      #<- here is singular because the position belongs to ONE player.
                                                     #<- When we use belongs_to, we have to add a column with a foreing key, in this case (player_id), shown in this table (line 145).
                end


#                           LETS USE THIS RELATIONSHIP

    # Let's do a query to find a player

        a = Player.find(1)
        # => this will return -
        id: 1, player: "C.Ronaldo", number: 7

    #Let's create a new Position

        b = Position.create(position: "Forward",
                                        player: "C.Ronaldo")
        # => This will return -
            id: 5, position: "Forward", player_id: 1


    #if we do a query with all the position of a player

        a = Player.find(1) #<- Fetch the player first. to store it in a variable.
        a.positions            #<- we can pass the methos " positions ", since we have a relationship with the 2 table

        # it will return an ARRAY with 3 instances of that Positions which belongs to "C.Ronaldo".

        [<Position id: 1,  position:"Left-Wing", player_id: 1>,
         <Position id: 3,  position:"Right-Wing", player_id:1>,
         <Position id: 5,  position:"Forward", player_id:1>]


    # Our Position Database will look like this.

=begin
    #Our table is ' position '

     ** Our table is called 'position'

                    id                      position                  player_id              <----Columns (Left to right)
             _______________________________________________________________________
            I    1            I             Left-Wing          I         1          I
            I-----------------------------------------------------------------------I
            I    2            I             Keeper             I         2          I
            I-----------------------------------------------------------------------I
            I    3            I             Right-Wing         I         1          I   <-- Notice that player with id = 1 can play two positions
            |-----------------------------------------------------------------------I
            I    4            I           Mid-fielder          I        4           I
            ------------------------------------------------------------------------I
            I    5            I           Mid-fielder          I        1           I
            I_______________________________________________________________________I
=end

    #AFTER WE CREATED THE RELATIONSHIP

    # We can find Positions with players Players

    #In our Rails Consule we can do the following queries.

    #Fetch a player
        a = Position.find(1)

            #it retuns...
            <Position id: 1,  position:"Left-Wing", player_id: 1>

    #we can call the player
        a.player

            #it returns...
            <Player id: 1, player: "C.Ronaldo", number: 7>

    #we can call the number of the player
     a.player.number

            #it returns...
            7




