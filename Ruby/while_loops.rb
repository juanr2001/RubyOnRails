#while loop will run as long as is TRUE. The loop stops when it is becomes FALSE


#------------------------------------------------------------------------------------------------------

answer = ""

while answer != "n"   #here is the condition, if you press ' n ' while loop stops
    print "Do you want to repeat this message?(y/n)"
    answer = gets.chomp.downcase
end

 #------------------------------------------------------------------------------------------------------
#make a method that will take a argument witht the time you want to print a String

def print_string(number_of_times)

    i = 0        #<-- here we are saying, let's start at 0

    while i <= number_of_times       #<-- Run as long as 0 is less then or equal then the argument
        puts "You printed me #{number_of_times}"
        i += 1              #<-- we have to increment otherwise, it become infinite loop.
    end
end

user_input = 0              #<-- we are saying, the user_input should start at 0

while user_input < 5    #<-- here, we are giving a stop contidional (when is less than five, STOP)
    print "How many time you want to print the sentence? (print 5 to exit) "
    user_input = gets.chomp.to_i
    print_string(user_input)                        #<-- here we are calling the method and passing the argument to be the user_input.
end

#---------------------------------------------------------------------------------------------

#Unlike the ' while loop ', the ' until loop ' will run as long as is FALSE. The loop stops until the it becomes TRUE

answer2 = ""
until answer2 == "no" do                        #<-- here the ' do ' is optional
    print "Do you want to print this string? "
    answer2 = gets.chomp
end


user_input = 0

until user_input >= 5                   #<-- here we are saying if you input a number greate or equal than 5, this loop will exit, because it becomes TRUE
    print "How many times you want to print this sentence? "
    user_input = gets.chomp.to_i
end

#Just print a number until it becomes greate than 4 (FALSE)

i = 0
until i > 4 do
  puts "#{i}"
  i += 1
end