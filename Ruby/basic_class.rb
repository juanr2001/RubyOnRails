#                                       BASIC CLASS

class Name
    def title
        "Mr."
    end
    def first_name
        "Juan"
    end
    def last_name
        "Ordaz"
    end
end

name = Name.new
puts name.title
puts name.first_name
puts name.last_name

#________________________________________________________________

#                                              INITIALIZING

class Name
    def initialize(title, first_name, last_name)
        #this are the intance veriables
        @title = title
        @first_name = first_name
        @last_name = last_name

    end
    def title
        @title
    end
    def first_name
        @first_name
    end
    def last_name
        @last_name
    end
end

name = Name.new("Sr.", "Juan", "Ordaz")
puts name.title + " " +
        name.first_name + " " +
        name.last_name

#________________________________________________________________

#                                                       ATTR_READER

class Name

=begin

    - attr_reader create the methods for us (the commented methods below)
    - It is important to know that attr_reader does not allow you to change the value of the variable.

    for exaple,
        name = Name.new("Sr.", "Juan", "Ordaz")
        name.title
        => "Sr."

        if I want to change the variable name with a different value
            name.title = "blah blah"
        => Returns an error

        Just know how attr_reader work.

=end


    attr_reader :title, :first_name, :last_name

    def initialize(title, first_name, last_name)
        #this are the intance veriables
        @title = title
        @first_name = first_name
        @last_name = last_name
    end

#     def title
#         @title
#     end
#     def first_name
#         @first_name
#     end
#     def last_name
#         @last_name
#     end
end

name = Name.new("Sr.", "Juan", "Ordaz")
puts name.title + " " +
        name.first_name + " " +
        name.last_name

#________________________________________________________________

#                                                                   ATTR_WRITER

class Name
=begin

    attr writer allows to change the value of the variable.
    if you look at the methods below(that I commented out) that is what
        attr_writer does for us.

=end
    attr_reader :title, :first_name, :last_name
    attr_writer :title, :first_name, :last_name

    def initialize(title, first_name, last_name)
        #this are the intance veriables
        @title = title
        @first_name = first_name
        @last_name = last_name
    end

    # def title=(new_title)
    #     @title = new_title

    # end

    # def first_name=(first_name)
    #     @first_name = first_name
    # end

    # def last_name=(last_name)
    #     @last_name = last_name
    # end

end

name = Name.new("Sr.", "Juan", "Ordaz")
# puts name.title + " " +
#         name.first_name + " " +
#         name.last_name

puts name.title
puts name.title = "Blah"
puts "Title changed: #{name.title}"

#________________________________________________________________

#                                                           ATTR_ACCESSOR

class Name
=begin

    attr_accessor is the same as both attr_reader and attr_writer together.

    -it allow use to read the value and change it.

=end
    attr_accessor :title, :first_name, :last_name

    def initialize(title, first_name, last_name)
        #this are the intance veriables
        @title = title
        @first_name = first_name
        @last_name = last_name
    end

    # def title=(new_title)
    #     @title = new_title

    # end

    # def first_name=(first_name)
    #     @first_name = first_name
    # end

    # def last_name=(last_name)
    #     @last_name = last_name
    # end

end

name = Name.new("Sr.", "Juan", "Ordaz")
# puts name.title + " " +
#         name.first_name + " " +
#         name.last_name

puts name.title
puts name.title = "Blah"
puts "Title changed: #{name.title}"

#________________________________________________________________

# #                                               CREATING METHODS

class Name

    attr_accessor :title, :first_name, :last_name

    def initialize(title, first_name, last_name)
        #this are the intance veriables
        @title = title
        @first_name = first_name
        @last_name = last_name
    end

    def full_name
        @first_name + " " + @last_name
    end

    def tiitle_and_name
        @title + " " + @first_name
    end

    def title_and_last_name
        @title + " " + @last_name
    end

    def tittle_and_full_name
        @title + full_name                  #<-- when we call a method in another method, this is call implicit return. It return the last item on line. in this case is a string
    end

    def name_and_last_name
        @first_name + " "+ last_name
    end
end
#different ways you can call your methods.

name = Name.new("Sr.", "Juan", "Ordaz")
puts name.title + " " + name.full_name
puts name.tiitle_and_name + " " + name.last_name
puts "Title, Last Name, and Name: #{name.title_and_last_name + ", "+ name.first_name}"
puts "Title and Full Name: #{name.tittle_and_full_name}"
puts "Only Name and Last Name: #{name.name_and_last_name}"

#                               INTANCE AND LOCAL VARIABLES

#________________________________________________________________

# INSTANCE variable = every class can use it.
# LOCAL as only its class can use the variables.

class Name

    attr_accessor :title, :first_name, :last_name
    attr_reader :first_and_last_name

    def initialize(title, first_name, last_name)
        #this are the intance veriables
        @title = title
        @first_name = first_name
        @last_name = last_name
    end

    def full_name

        #this is a local variable (no @ symbol). We do not have access to it.
        # first_and_last_name = @first_name + " " + @last_name
        # first_and_last_name + " " + @title

        #this is a instance variable
        @first_and_last_name = @first_name + " " + @last_name
        @first_and_last_name + " " + @title
    end

    def tiitle_and_name
        @title + " " + @first_name
    end

    def title_and_last_name
        @title + " " + @last_name
    end

    def tittle_and_full_name
        @title + full_name
    end

    def name_and_last_name
        @first_name + " "+ last_name
    end
end
#different ways you can call your methods.

name = Name.new("Sr.", "Juan", "Ordaz")
#this will create an error if is a local variable and  we call it. However, If we add the @ symbol to the variable, now we can call it.
#After adding the @ symbol, this will give you an error if we call it, because we haven't defined a method(first_and_last_name), but we can easly add a attr_reader and pass the name like shown above.
#After we set the attr_reader, we still get nil...because it's an does not have a value until we call the method (full_name) then we can call the method (first_and_last_name)
puts name.first_and_last_name

# So, first call this method
puts name.full_name

#then, call the method.
puts name.first_and_last_name

#________________________________________________________________

class Name

    attr_accessor :title, :first_name, :last_name
    attr_reader :first_and_last_name

    def initialize(title, first_name, last_name)
        #this are the intance veriables
        @title = title
        @first_name = first_name
        @last_name = last_name
    end

    def tiitle_and_name
        @title + " " + @first_name
    end

    def title_and_last_name
        @title + " " + @last_name
    end

    def tittle_and_full_name
        @title + full_name
    end

    def name_and_last_name
        @first_name + " "+ last_name
    end


# In Ruby we commonly  use, when writing classes is to define a `to_s` method, which tells Ruby how to print out a class.
    def to_s
        name_and_last_name() #<-- here I am taking the method above and call it here and it will print it as a string
    end
end

name = Name.new("Sr.", "Juan", "Ordaz")
puts name #<-- I didn't have to pass the to_s method
