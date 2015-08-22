=begin

Controllers controls the Models and Views.

    - Controllers use Models to retrieve Data from the Database
    - Controllers use Views to display to the user the Data that was retrieve from the Models.

 * This might be confusing, but you will understand throughout this file how controllers works.

=end

#               (Read ' basics_view.erb ' file before you continue reading to understand how we got here.)



#   *  In app/views/positions/show.html.erb we did something like the code below (line 22-24)....

#       -If you see in the code below (line-22-24), " Position.find(1) ".
#           - 1) Calling the Model in the Views is NOT correct. It should NOT be happening in our Views.
#           - 2) The Controllers should be Calling the Models, and not the Views calling Models.

                    <% position = Position.find(1) %>
                    <h2><%= position.position%></h2>
                    <p> Position of: <%=  position.player%> </p>


#           - When a request comes-in in our application...
#               Ex:
                        /positions/1

#       -Before the request gets to our VIEWS, FIRST is going to trigger a CONTROLLER!!!

#           ( Rails automatically create a Controllers Folder for us. (so in this example, since we created a Position Model, and positions database table, the name for the controller should be the same too.)
#               -This is the path to find the Positions Controller in your Rails project: app/controllers/positions_controller.rb )

#       -So, when we make a request is going to RENDER-out the ' show view ' (show.html.erb (VIEW))

                            position = Position.find(1)        #<-- Again, this code should be in the Controllers.

#       -But How Views and Controllers know so much from each other????...HMM!... Let me explain

#           - Our ' URL '  is called
                    ' positions '/1 #<-- This is asking for the all ' positions ' with id = 1(obviously will only one), the same we are writing in line 38. Pathesis shouldn't not be there, is just to explain and stress the word

#           - Our ' Controller'  is called
                    app/controllers/' positions '_controller  #<-- Pathesis shouldn't not be there, is just to explain and stress the word.

#           - Our ' Views ' is called
                    app/views/' positions '/show.html.erb       #<-- Pathesis shouldn't not be there, is just to explain and stress the word.

#           ( We don't have to MAP everything if we use CONVENTION.
#                               CONVENTION OVER CONFIGURATION!
#                       - Basically is saying follow ' Default ' settings, or you will have to configure your app. )



#                                    WHAT GOES IN OUR CONTROLLER?

# - The Postions Controller looks like this

                    class PositionsController < ApplicationController

                    end

#       -Now we need to the define a Show method

                    class PositionsController < ApplicationController

                        def show      #<-- This can be called METHODS or ACTIONS, either way is good.
                        end

                    end

#       - If you notice, our ' show method ' has the same name as ' show ' file located in our VIEWs folder
                        app/views/' show' .html.erb #<-- Pathesis shouldn't not be there, is just to explain and stress the word.
#                   -This is what MAPS one to the other (controllers and views)!!!!!!!!

#       - Inside the METHOD(s) is where we call our MODELS to get DATA from the databse!!!, as shown below.

                    class PositionsController < ApplicationController
                        def show
                            position = Position.find(1)  #<-- Here we are asking the database to give us the Position with the id = 1
                        end
                    end

#       - Now when a request COMES-IN
                ' positions '/1 #<-- This is going to trigger the Positions Controller and call the SHOW method in our CONTROLLER to get the DATA we are asking

#       - This is the show method from our controller. (same as in the previous lines.

                    class PositionsController < ApplicationController
                        def show
                            position = Position.find(1)  #<-- After it runs this code, by DEFAULT, is going to  LOOK FOR our SHOW view
                        end
                    end

#       - This is our show view file content.

                    <h2><%= position.position%></h2>
                    <p> Position of: <%=  position.player%></p>  # This two lines will RENDER-OUT to the browser.


#                   How in the world our VIEWs have ACCESS to out CONTROLLER???.

#   - Have you hear of...
                    variable scope

#       -SORRY all our code above would NOT work without ' variable scope ', but is easy to add, just add the " @ " symble to your code like this...

#           -In our controller we just have add the (' @ ' )symble like this...

                    class PositionsController < ApplicationController
                        def show
                            @position = Position.find(1)  #<-- @ symble should be in front of the variable.
                        end
                    end

#           - In our SHOW view file we just have to add ( ' @ ' ) symble like this...
                    <h2><%= @position.position%></h2>
                    <p> Position of: <%=  @position.player%></p>

#       - The ' @ ' symble is what GRANT the VIEWS to have ACCESS to our Controllers variables.
#           - when we have @positions in Ruby, it becomes an ' INSTANCE VARIABLE '. like I said it grant view access to variables.


#               What if We don't want to follow  RAILS CONVENTION ???

#       - For example:
#                               Instead of naming our view
                                        ' show.html.erb '
#                               and we decided to call it
                                        ' position.html.erb '

#           - In that Case we can specify the name of our NEW VIEW in our Controller, so it can find it. If you don't specify it, you are in a big trouble.

                    class PositionsController < ApplicationController
                        def show
                            @position = Position.find(1)
                            render action: 'position'
                        end
                    end


#           We have been working to show (or to render) just the Player with the id = 1

# - How can we make the code be able to show any players with a specific ' id '.
#       -For example:
#                               - What if the user wants to see Player with the id = 2, or id = 3, or id = 4??

#       - When we write URL's like this...
                         ' positions '/1
#               -Rails will generate for use a new HASH call
                        params
#                   -which contain a HASH with a key and a value
                        params = {id: ' 1 '}

#       - So, to render a specific player with a specific ' id ' in our Controllers we just have to add this...
                    class PositionsController < ApplicationController
                        def show
                            @position = Position.find(params[:id])  #<-- This is what going to look out for the specifc player in the database, and it's going to reder it
                        end
                    end

#                       LET's UNDERSTAND PARAMETERS (params)
#     BEFORE we continue, let 's pretend we have a Database table name ' positions'  with an attribute(column) called player_position.(we created this so you  understand it better, since I have ' position ' as attribute. You can get confuse.)

#  - When we write the following URL. ( we are using  ' standard url query parameters ')
                /positions?player_position=Forward  #<-- Rails will create a new HASH to crate a new position.

#       -the URL above will basically do this Hash to create a new player_position...
                params = { player_position: "Forward"}

#           -This is what is happening from the code above.
                @position = Position.create(player_position: params[:player_position]) #basically we are taking the ' player_position ' out of the paramenter (in line 171) to create this position.

#  - Most likely our URL might look like this, where we have a HASH within a HASH
                /positions?position[:player_position]=Forward

#           - here is the HASH within a HASH from the URL above
                params = {position: {player_position: "Forward"}}

#       - this is how  we can access the position in the hash within a hash, from the code above.
                @position = Position.create(player_position: params[:position][:player_positon]) #<-- basically we specify two keys to get what we want inside the hash within a hash(in the case player_position.)

#               -There is an alternative Syntax from the code above. Because our Position Method is expecting a HASH
                @position = Position.create(params[:position]). #<-- What is going to be sent to ' create ' is the HASH of the position that contains the player_position("Forward"). This is a better way to write it, instead from the code above and recreating a hash.


#                       STRONG PARAMETERS!!!!

                /positions?position[:player_position]=Forward
#       - This code can be dangerous because the USER might be able to set any attributes by sending additional ' keys and values ' for this hash on the URL
                @position = Position.create(params[:position])
#       - So, in RAILS 4 we are required to use STRONG PARAMETERS!!!. This makes code more SECURE.

#       - To do a strong parameters, we need to specify the parameter ' key ' the ACTION is expecting

                    require(:position) #we are saying parameter key is requier to sent in from our HASH

#           - and also we need to specify the attributes we will permit to be ' set '' from the HASH
                    permit(:position)

# The code should look like this...
                        @position = Position.create(params.require(:position).permit(:player_position))

#           - If we need need to ' permit ' more attributes, we can us an ARRAY
                        @position = Position.create(params.require(:position).permit(:player_position, :other_positions))

#                           WHAT, WHEN Strong Parameter are used?
#   - Strong Params are requiere only when:

            Creating or Updating    - ...with multiple attributes


#                           RAILS Developer usually Creates API's for a webservice.

# - There are two things you usually supply to Front-End Developers or Mobile Developers.

#       - XML

                    <?xml version = "1.0" encoding="UTF-8"?>
                    <position>
                        <id type="integer">1</id>
                        <player_position>Forward</player_position>
                        <player-id type="integer">1</player-id>
                    </position>


#       - JSON
                    {"position":{"id": 1,"player_position": "Forward", "player_id": 1}}


#   -If we want the JSON representation for
                    /positions/1
#       -we can send a URL
                    /positions/1.json

#       - Now, in our Positions Controller,
#           -Inside of our show method, is where Magic happens
                    class PositionsController < ApplicationController
                        def show
                            @position = Position.find(params[:id])
                            #We need to tell Rails what ' format ' it can ' respond to '
                            respond_to do | format |
                                format.html #show.html.erb ------ format.html is very common to see, but is not required, and it will not affect anything. It's just reminding that it will render ' show.html.erb ' by default
                                format.json { render json: @position } #<-- here we are requesting the app to respond to ' json '. After it does, we want to ' render ' as ' json ' this specific ' position '
                        end
                    end
#           - This is the responce after format as JSON
                    {"position":{"id": 1,
                                        "player_position": "Forward",
                                        "player_id": 1}}


# - Similarily, we do the same if we want XML as a responce...like this...

#       -If we want the XML representation for
                    /positions/1
#       -we can send a URL
                    /positions/1.xml

                    class PositionsController < ApplicationController
                        def show
                            @position = Position.find(params[:id])
                            #We need to tell Rails what ' format ' it can ' respond to '
                            respond_to do | format |
                                format.html #show.html.erb ------ format.html is very common to see, but is not required, and it will not affect anything. It's just reminding that it will render ' show.html.erb ' by default
                                format.json { render json: @position } #<-- here we are requesting the app to respond to ' json '. After it does, we want to ' render ' as ' json ' this specific ' position '
                                format.xml { render xml: @position } #<-- here we are requesting the app to respond to ' xml '. After it does, we want to ' render ' as 'xml ' this specific ' position '
                        end
                    end

#       - This is the responce after format as XML

                    <?xml version = "1.0" encoding="UTF-8"?>
                    <position>
                        <id type="integer">1</id>
                        <player_position>Forward</player_position>
                        <player-id type="integer">1</player-id>
                    </position>



#  - The Actions in the Controllers are the same for all controller, here is the list of all of the ACTIONS.
#       -All of this ACTIONS will have its own VIEWS, when generating the controller
                    class PositionsController < ApplicationController

                        def index
                            #list all positions
                        end

                        def show
                            #shows a single position
                        end

                        def new
                            # show a new position ' form '
                        end

                        def edit
                            #shows the edit position ' form '
                        end

                        def create
                            #creates a new position
                        end

                        def update
                            #updates a position
                        end

                        def destroy
                            #destroy a position

                        end

                    end


# Let's do Edit action for an example. Remember each action has it's own view
    # Pretend we are in the browser, We will see the list of all the player's positions. Every player has its own edit link. When we click the edit link. It will TRIGGER the EDIT ACTION

    # - When it trigger the edit controller, then is going to look for the edit.html.erb
        realmadrid/app/views/position/edit.html.erb
    # - The edit Action looks like this
                        class PositionsController < ApplicationController
                            def edit
                                @position = Position.player_position(params[:id]) #<-- by default is going to ' render the edit action', it going to look for the edit.html.erb
                            end
                        end
    # - In the browser, you will see the  form with the attributes you want to edit, with the update button.



#- Right Now, if we want to edit each Player's Position you CAN. That's NOT good, because what if that Player's Position does not belongs to you?

#-                          LET's DO AUTHANTICATIONS

#           - To do that, we go to our POSITION CONTROLLER an add some code

                        class PositionsController < ApplicationController
                            def edit
                                @position = Position.player_position(params[:id]) #<-- by default is going to ' render the edit action', it going to look for the edit.html.erb
                                #session is like a user hash- where we can store info (that belong to that user hash when they login)
                                if session[:player_id] != @position.player_id
                                    #flash is a helper that allows to send messages back to the user, uncase they did something wrong or alert them.
                                    flash[:notice] = "You can edit this position"
                                    #Here we need to rederect the user to the list of the positions, because we don't want to render the ' edit  form' becuae the user might not be allow to edit it
                                    reditect_to(positions_path)
                            end
                        end
#           - here is the Syntax for a simpler code format for 'flash' and "redirect_to"
                    redirect_to (positions_path, notice: "You can edit this position")


# Now, let's tell  Rails  to show this "flash notice", follow this path in your Rails app.

    app/views/layouts/application.html.erb

        <!DOCTYPE html>
        <head>
            <title> Real Madrid </title>
        </head>

        <body>
            <% if flash[:notice] %> #here we are saying, if there is a  flash
                <div id="notice"> <%= flash[:notice] %></div>
            <%end%>
            <%yield%>
        </body>
        </html>

# - After we wrote this code above, we should get redirected to the list of the positions with a notice, if we try to edit a position it does NOT belongs to us.


# Back to our Position Controller, Do you remember DRY (Don't Repeat Yourslelf)?
#           -These three ACTIONS below, require to fetch the position. But we are repeating ourselves
                    class PositionsController < ApplicationController

                    #We are repeating ourselves
                        def edit
                            #shows the edit position ' form '
                            @position = Position.find([:id])
                        end

                        def update
                            #updates a position
                            @position = Position.find([:id])
                        end

                        def destroy
                            #destroy a position
                            @position = Position.find([:id])

                        end

                    end

#           - To fix this repetition, we need to us a CALLBACK !!

                    class PositionsController < ApplicationController
                        #this is a CALLBACK
                        # Here we are sayin every ACTION here, we want to call ' fetch_option ' method, but ONLY ' edit, update, and detroy'
                        before_action :fetch_position, only: [:edit, :update,:destroy]

                        def fetch_position
                            @position = Position.find([:id])
                        end
                        def edit
                        end

                        def update
                        end

                        def destroy
                        end
                    end


#           - We know that If we want to edit, update and delete a Position, We need to be authanticated(meaning the Position has to be ours). So we dont want to repeat this code either...

                                    if session[:player_id] != @position.player_id
                                        flash[:notice] = "You can edit this position"
                                        reditect_to(positions_path)
                                    end

#               -We can fix this by writing a new method and use another CALLBACK!!!

                    class PositionsController < ApplicationController
                        # Here we are sayin every ACTION here, we want to call ' fetch_option ' method, but ONLY ' edit, update, and detroy'
                        before_action :fetch_position, only: [:edit, :update,:destroy]
                        before_action :authantication, only: [:edit, :update,:destroy]

                        def fetch_position
                            @position = Position.find([:id])
                        end

                        def authantication
                                if session[:player_id] != @position.player_id
                                    flash[:notice] = "You can edit this position"
                                    reditect_to(positions_path)
                                end
                        end

                        def edit
                        end

                        def update
                        end

                        def destroy
                        end
                    end