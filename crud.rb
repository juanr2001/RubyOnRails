# CREATE READ UPDATE DELETE = CRUD
=begin

    Suppost we have a database
     ** Our table is called 'players'

                    id                      player                      position                    number               <----Columns (Left to right)
             ______________________________________________________________________________________________________
            I    1            I           C.Ronaldo          I             Left-Wing          I         7          I
            I------------------------------------------------------------------------------------------------------I
            I    2            I           Navas              I             Keeper             I         1          I
            I------------------------------------------------------------------------------------------------------I
            I    3            I           Bale               I             Right-Wing         I         5          I
            |-------------------------------------------------------------------------------------------------------I
            I    4            I           J. Mata           I            Mid-fielder           I        14         I
            I______________________________________________________________________________________________________I




    If we have a hash and we want to retrieve a value of the hash

     -this is a hash { key = value}

     To retrieve a value out of a variable where the hash is store...

        variable[:key] => value

    a = {
        id: 1
        player: "C.Ronaldo"
        position: "Left-Wing"
        number: 7
    }

    If we can do this in the Rails' console if we have a rails project
=end

    a[:player]
# this will return = "C.Ronaldo"

# We can also retrieve to values at the same time

    a[:player] + " plays as " + a[:position]
#this will return = "C.Ronaldo plays as Left-Wing"

#To retrive the Player ' object ' with id = 1  <--- Meaning all rows with id = 1
## We can do this in Rails' console

    a = Player.find(1)

#this will return { id: 1,
#                         player: C.Ronaldo,
#                         position: Left-Wing,
#                         number: 7}

#In Rails, when we use 'Player' it allow us to access the table ' players '

# Since we store the data inside a variable, we can access that data like this.

    puts a[:id]
# => 1
    puts a[:player]
# => "C.Ronaldo"
    puts a[:position]
# => "Left-Wing"
    puts a[:number]
# => 7

#Other way to retrive hash values, like above...

    puts a.id
    puts a.player
    puts a.position
    puts a.number

#both ways are good, but dot syntax is better.

CREATE
#after store it in a variable                                                                   Syntax
    a = Player.new                                                                          a = TableName.new
    #create a row in the column position
    a.position = "Goal Keeper"                                                        a.key = value
    #save it
    a.save                                                                                        a.save

# Alternative Syntax,
#if we want to add multiple keys and values (hash)

    a = Player.new( player: "Benzema",                                          a = TableName.new(hash)
                              position: "Forward"
                              number: "9")
    a.save                                                                                          a.save


# If we want to create a Player and save it automatically,
# without calling ' save '

    a = Player.create(player: "Mesi",                                                a = TableName.create(hash)
                                position: "Center-Mid"
                                number: "10")






READ
#we can store it in the variable to access it later
    Player.find(1)

# We can pass multiple parameters to find multiple players.
    #This will return an ARRAY of players
    Player.find(1, 2, 3, 4)

#Wen can call ' first ' method
    #will return first player of the table
    Player.first

# We can use ' last ' method
    #will return the last player of the table
    Player.last

# We can use ' all ' method
    #will return an ARRAY of all the players of the table
    Player.all

    -QUERIES #other ways to read data from the table

        #To count the total of Players
            #return the total as an integer
            Player.count

        #To order by ' player' or any column you want
            #return all player, ordered by player
            Player.order(:player)

        #To limit the number of return
            #Return only the first 4 players
            Player.limit(4)

        #To ask for specific column with a specific value
            #if there are multiple players name C.Ronaldo, it will return all of them
            Player.where(player: "C.Ronaldo")

            CHAINING METHODS # when retrieving data from the database
                #doing this query, it will do three things for us
                # 1) Fetch only the players with the name  "C.Ronaldo"
                # 2) Than, will order them by the number
                # 3) Than, will only return the first 3
                Player.where(player: "C.Ronaldo").order(:number).limit(3)

                #this is will fetch players with name C.Ronaldo
                #Than, will only return the first C.Ronaldo(if there are multiple)
                Player.where(player: "C.Ronaldo").first


UPDATE
    # First, fetch the player with id 1                                                                      Syntax
    a = Player.find(1)                                                                                         a = TableName.find(id)
    #change the row of the column to anything you want
    a.position = "Forward"                                                                                  a.ket = value
    #save it
    a.save                                                                                                            a.save


    # If we want to update multiple attributes
        # fetch the player we want to update
        a = Player .find(1)                                                                                       a = TableName.find(id)
        #call attributes method an pass a hash
        a.attributes = {                                                                                             a.attributes = { key: value}
            position: "Defense",
            number: 3
        }
        #than, save it
        a.save                                                                                                           a.save

    #Other way to update without calling ' save '
        #Fetch the player you want to update
        a = Player.find(1)                                                                                          a = TableName.find(id)
        #call update method and pass a hash, it saves it automatically
        a.update( position: "Defense",                                                                       a.update(key:  value)
                        number: 3)

DELETE
    #First, find the player you want to delete
    a = Player.find(1)                                                                                                a = TableName.find(id)
    # Call the destroy method
    a.destroy                                                                                                               a.destroy

    #Can do it in one line, fetching the player, than use
    #destroy method
    Player.find(1).destroy                                                                                             TableName.find(id).destroy

    #We can delete all the players by using destroy_all method
    Player.destroy_all                                                                                                    TableName.destroy_all

