#loop do we use ' brake ' to exit the loop.
=begin

There are two different ways to write "loops"

1) using ' do ' and ' end '

loop do

end


2) Using open and closing brakets

loop {

}

=end




#add the number to the array, but until it only has 3 index.

numbers = []
number = 0

numbers << number

loop do

    number += 1
    numbers << number

    if numbers.index.count == 3
        break
    end
end

puts numbers


#guess a random number using a loop.

number = Random.rand(5)

loop do
    print "Guess the number ( (e)  to exit): "
    guess = gets.chomp.to_i

    if guess  == "e"
        break
    end

    if guess == number
        print "Your guess is correct!"
        break
    else
        puts "Guess again"
    end
end


#using numbers to exit the loop
loop do
    puts "Exit loop if enter a number greater than 5: "
    number = gets.chomp.to_i

    if number >= 5
        break
    end
end

#ask a name using a loop, break until it meets the criteria.
def ask_name
    name = " "

    loop do
        puts "What is your name? "
        name = gets.chomp

        if name.length >= 3 && !name.index(/\d/)
            break
        else
            puts "You name must contain 3 or more carachters"
        end
    end
        return name
end

name = ask_name
puts "Hi #{name}"


#enter a letter to exit loop.
answer = ""

loop do
    puts "Enter (e) to exit the loop"

    answer = gets.chomp

    if answer == "e"
        break
    else
        puts "you need to enter (e) to exit"
    end
end
