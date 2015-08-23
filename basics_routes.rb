=begin

            We will be building Routes here, we wrote some ' path ' in ' basics_views.rb ' file

                -Here you will see how PATHS are generated.

=end

# - We did this (line 12-24) in ' basics_views.rb ' file. You might wonder, How was URL and CODE generated for each ACTION in the CONTROLLER?

        Action                                      Code                                       URL

List all positions                              positions_path                              /positions
New position form                               new_position_path                           /position/new


#This following paths need a ' position '

position = Position.find(1)

Show a position                                 position                                    /positions/1
Edit a position                                 edit_position_path(position)                /position/1/edit
Delete a position                               position, method: :delete                   /position/1



# In order to generate the CODE and URL as you see in the code about, first we need to define ROUTES in ' routes.rb file '

#       - In your Rails app, follow this path to find the routes file:
                realmadrid/config/routes.rb    #<-- Real Madrid is the name of this app, so you might have a different name.

#       - Inside the file, it should look something like this...

                RealMadrid::Application.routes.draw do

                    resources :positions                #<-- inside this block is where we write our routes. This is also called RESTful resource

                end
#           - the code inside the block generates automatically all this PATHS for us for our Controllers.

                    Action(Controller)                                      Code                                       URL

List all positions(Index)                              positions_path                              /positions
New position form(New)                               new_position_path                           /position/new


#This following paths need a ' position '

position = Position.find(1)

Show a position(Show)                                 position                                    /positions/1
Edit a position(Edit)                                 edit_position_path(position)                /position/1/edit
Delete a position(Destroy)                          position, method: :delete                   /position/1

#here is the rest
Update a position(Update)                               position, method: :patch        /position




#                                               CUSTOM ROUTES

# -If you don't want to have the paths  ' resources ' generates, you can customize it.

#       - For example if you want to make you path look like this...

                    /new_position

#           - Instead of like this...
                    /new            # <-- The is what ' resources'  will generate.

#       - In routes.rb you can do this.

                RealMadrid::Application.routes.draw do

                    resources :positions                #<-- inside this block is where we write our routes. This is also called RESTful resource
                    get '/new_position' => 'positions#new' #<-- in the FIRST string, we specify the PATH. In the SECOND string we specify the "CONTROLLER#ACTION"
                end

#       - Now, If we want to change the PATH for show all the positions.

#           - If we want to make our PATH look like this...
                        /all_positions

#               -instead of like this...
                        /positions          # <-- The is what ' resources'  will generate.

#           - In routes.rb you can do this.

                        get '/all_positions' => 'positions#index' #<-- in the FIRST string, we specify the PATH. In the SECOND string we specify the "CONTROLLER#ACTION"

#           - We know that how use the helper " link_to "...

                        <% link_to text_we_want_to_show, code %>

#           - The question is how do we use our ' custom routes ' inside the ' link_to ' helper??

#               - First go to your " routes.rb " file and add this code...

                        get '/all_positions' => 'positions#index', as: "all_positions"   #<-- as: "...." is the name of the path.

#               - Now when you use the ' link_to ' helper, just write the "all_positions" path

                    <%= link_to "List Positions", all_positions_path %>

#           - At this point, when your Run the ' rails server ' you be writing

                    localhost:3000/all_positions   #Now will reder the List of All Position.


#       - Now, If the user write ' localhost:3000/all_positions ' in the browser, and we decide to rederect the user to a path call "/blah_positions". To do that, we do this...
#                  get 'all' => redirect('/blah_positions')

#           -This is very helpul because we can reditect to the user other sites, if the user inputs the  X site. Watch...
                    get '/facebook' => redirect('https://www.facebook.com')



#                                           ROOT ROUTE

# - Root Routes is when the user type the your domain, and the fisrt thing they see is the introduction of your site( can be anything, you can set your ' root route ' to show one position, or all positions when the user type your domain).

                        htttp://localhost:3000/    #<-- this is rails domain. and is the the Root Route. When you type this in the browser you will see the home page of Rails.

#      - How do make the user see all the positions(render index action of our controller) when they type just...
                         htttp://localhost:3000/

#           - Simply do this...
                        root to: "positions#index"   #<-- Remember, inside the String, "Controller#Action"

#           - To use this path using "link_to" helper, we do this...

                        <%= link_to "List Positions", root_path %>