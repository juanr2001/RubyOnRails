#Using iterators, basically it saves time but it takes Practice to understand it...

array = [ 1, 2, 3, 4, 5, 6 ]

number = 0

while number < array.length  #<--  as long as the number is less than the index inside the array.
    num = array[number]         #<-- here we call a variable ' num ' to equals the number is going to be printed and to store it inside the array. But, as long as it does not exeded the number of index inside the array.
    puts "I am the number #{num}"
    number += 1
end

#This is the out put of the code above

# I am the number 1
# I am the number 2
# I am the number 3
# I am the number 4
# I am the number 5
# I am the number 6

#--------------------------------------------------------------------------------

# This code below does the samething as the while loop above, but with less typing.

array = [ 1, 2, 3, 4, 5, 6 ]

array.each do | num |       #<-- here is saying, go through each number inside the array, passing an argument(you can call it whatever you want)
    puts "I am the number #{num}"   #<-- here we print the string with same name of the argument we pass above.(num)
end


#This is the out put of the code above

# I am the number 1
# I am the number 2
# I am the number 3
# I am the number 4
# I am the number 5
# I am the number 6

#--------------------------------------------------------------------------------



#let use the same array and add numbers

array = [ 1, 2, 3, 4, 5, 6 ]

array.each do | num |
        num = num + 3
        puts "After adding 3 the number is #{num}"
end
#when we check the array, it does not change the value of the array, because what ever it changes, is only inside the block
puts array.inspect

#This is the out put of the code above

# After adding 3 the number is 4
# After adding 3 the number is 5
# After adding 3 the number is 6
# After adding 3 the number is 7
# After adding 3 the number is 8
# After adding 3 the number is 9
# [1, 2, 3, 4, 5, 6]

#--------------------------------------------------------------------------------

#Hash are almost the same as arrays, but instead of passing only one argument in ' each ', we pass 2.

hash = { name: "Juan", last_name: "Ordaz"}

#you can also use the method called ' each_pair '  it does the same as ' each '
hash.each do | key, value | #<-- you can call the arguments, whatever you like.

    puts "My #{key} is #{value}"

end

#This is the out put of the code above

# My name is Juan
# My last_name is Ordaz

#--------------------------------------------------------------------------------

#if you want to print only keys
hash.each_key do | key |
    puts "#{key}"
end

#This is the out put of the code above

# name
# last_name

#--------------------------------------------------------------------------------

#if you want to print only values.
hash.each_value do | value |
    puts "#{value}"
end

#This is the out put of the code above
# Juan
# Ordaz

#--------------------------------------------------------------------------------



#rembers iterating will not affect the hash values!!!!