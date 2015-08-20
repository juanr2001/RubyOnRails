#These are the ways you can write code, but there are always better ways

#Imagine we have a list of guesses
                               # TRANSLATION 
    if ! guesses.empty?        #<-- If the guesses is not empty,
        puts "You guessed"     #<-- print this string, and
        puts guesses           #<-- give me the guesses
    end

#The code above can be written using Unless
                               # TRANSLATION 
    unless guesses.empty?      # <-- As long as the guesses is not empty,
        puts "You guessed"     # <-- print this string, and
        puts guesses           # <-- give me the guesses
    end

#  Also, can do this...
                                    # TRANSLATION 
    unless guesses.empty?           #<-- as long as the guesses is not empty
        puts "You guessed"          #<-- print this string, and
        puts guesses                #<-- give me the guesses.
    else                            #<-- However, if it is empty,
        puts "You haven't guess"    #<-- print this string. (I haven't guess anything)
    end

# A better way, If you are using unless with guess, you can use if-else conditional
                                                # TRANSLATION 
    if guesses.empty?                           #<-- If the guesses is empty, then
        puts "you havent You guessed"           #<-- print this.
    else                                        #<-- However, if is not empty(if there is something),
        puts "You guessed"                      #<-- print this string, and
        puts guess                              #<-- give me the guesses.
    end

# In conditionals ' nil ' is treated as false.
                                            # TRANSLATION 
    if guesses.list != nil                  #<-- If the list of the guesses are not nil(not empty) then
        guesses.show                        #<-- I want to see the guesses (show method is not a ruby method, this is just to explain)
    end

    #Since nil above is false, a way to write it to better understand the code is.
                                            # TRANSLATION 
    if guesses.list                         #<-- If there is a list of guesses (list method is just to explain, is not ruby method)
        guesses.show                        #<-- I want to see them.(show method is not a Ruby methos, is just to explain)
    end





#                                       Crazy stuff.

#If you think the meaning ' nil'  is the same as ' nothing ' , well that's not always the case
                # TRANSLATION 
    " "         #<-- An empty string is, with ' nothing ' inside, will be treated as TRUE.
    0           #<-- Is also treated as TRUE, even if it means " nothing "
    []          #<-- Empty Array, with ' nothing ' in it, with also be treated as TRUE

# Example
                                                            # TRANSLATION             
    unless guesses.length                                   #<-- as long as there is not a length of guesses. Ex: "Juan".length = 4, " ".length = 0
        warn "You need to guess something"                  #<-- but this code is always be true, because, empty string return true
    end


# Inline Conditionals

# to write a code inline, let's write this example first
                                                            # TRANSLATION 
    if guesses.length < 10                                  #<-- If the guesses length is less than 10 then
        puts "guesses are too short"                        #<-- I will tell you that your guess is too short
    end
                                                            # TRANSLATION 
    unless guesses                                          #<-- As long as there is no guesses
        puts "You haven't guess"                            #<-- I will tell you that you haven't guess.
    end

# this is Inline conditional...

    puts "guesses are too short" if guesses.length < 10
    puts "You haven't guess" unless guesses



#                                   Let's ' && ', pronaunce as "AND"
                                                    # TRANSLATION 
    if guesses                                      #<-- if there is a lot of guesses, AND " && "
        if guess                                    #<-- if there is ONE guess. " THINK, the code ABOVE must be TRUE too."
            puts "Here is the guess"                #<-- just print this string,
            puts guess                              #<-- give me the ONE guess.
        end
    end

# to simplified the code above.
                                                    # TRANSLATION 
    if guesses && guess                             #<-- if the guesses is false, guess never runs (Both have to be true)
        puts "here are the guess and guesses."      #<-- this will never be printed until both (guess && guesses) are true
    end


# This is confusing, so here are better examples.
    
    # || the pipes means OR

    # Whatever is true first, will be printed
    #if false is first, than it jumps to the other side of the pipe to find true.
                                # TRANSLATION 
    number = true || false      #<-- Return TRUE
    number = false || true      #<-- Return TRUE
    number = false || false     #<-- Return FALSE, because, both are false
    number = true || true       #<-- Returns the first TRUE!
    
    # && means AND
                                # TRANSLATION 
    number = true && true       #<-- Return TRUE
    number = true && false      #<-- Returns FALSE
    number = false && true      #<-- Return FALSE
    number = false && false     #<-- Return FALSE


# Let's pretend we have a list of guesses
                                      # TRANSLATION 
    guesses = list.guesses            #<-- Store the list of guesses in a variable
    gusses = [] unless gueeses        #<-- As long as there is NO guesses, guesses will equal to an EMPTY ARRAY.

#We can write it  with ' || ' pipes (OR)

    guesses = list.guesses || []

# We can also make method to store the code above (line 112)

    def my_guesses
        gusses || []          #<-- what ever is true first, is going to run.
    end

# Let's look another example with Conditional Assignments.
    
    #What line will be printed first???

    guesses = "Juan"
    guesses ||= "Juan Ordaz"

    puts "guesses"

    "Juan" #<-- WHYYY???...
    
        guesses ||= "Juan Ordaz"

        guesses = "Juan" || "Juan Ordaz"  #<-- because "Juan"  is true first than "Juan Ordaz", it does not jump to the other side.


        # Let me explain how Conditional Assignment works
             a ||= c

             # the code above is the same as...
             a = a || c  #<-- here we see that 'a' is variable, ' a '. 'a' variable will always return true, if either side ( a || c) is true, if both are false, than ' a ' variable returns false

             # but behaves like...
             a || a = c  #<-- Return the the first true, if "a" is true, than "a = c" never runs.

        #Ex:
            a = nil
            c = 2

            a ||= c

            a = 2  #<-- You see why this happened????
        # Let's use the variable a = nil and c = 2 (same as line 156)
            a = nil || 2      #<-- since nil is false, then ' a ' must be 2
            a = 2
        # Let's use the example with a = nill and c = 2(same as line 159)
            nil || nil = 2  #<-- This example kind of suck, because we are using a reserve word (nil = 2). But you see how Conditional Assignment works.
            nil = 2         #<-- This will give you an error, but this is just an example.


# What will be printed first here.??
    name ||= "John"

    puts name

    # line 133 will be printed first
    "John"

    name = name ||= "John" #<-- since name is nil(false), it will always print "John"

# You can also see it this way, How to use Conditinal Assignments

    choice[:one] = "one" if choice[1].nil?

    # this is how you can Refactor the code above
    choice[:one] ||= "one"



    #     Conditional always Return a Value.

    #this is a way to start practicing If- else conditionals, but this is not a good way to write it. Stay DRY! (Don't Repeat Yourself)
                                            # TRANSLATION 
    if guesses                              #<-- if there are guesses
        guess = "Juan"                      #<-- give me this string
    else                                    #<-- if there is no guesses,
        guess = "No guesses"                #<-- print this string. NOTICE, we are calling guess 2 times. not good.
    end

    # We can do this to fix the code a little...
                                            # TRANSLATION 
    guess = if guesses                      #<-- set guess equal to "Juan" if there is guesses
    "juan"
    else
    "Ordaz"                                 #<-- Otherwise, print "Ordaz", if there are no guesses
    end

    # Now, Let's put it in the method.
                                        # TRANSLATION 
    def my_guesses(my_name, guesses)    #<-- When we call the method, we have to write two parameters like this.... my_guess("Anthony", "friend")
        if guesses                      #<-- if there is a guesses, than
            guess = "Juan"              #<-- print the guess's values, which is "Juan"
        else
            guess = "Ordaz"             #<-- if there is not a guesses, print this guess's value, which is "Ordaz".... We are repeating our-selves again. NOT GOOD!!
        end
        guesses                         #<-- return what ever guesses is (either "Juan" or "Ordaz"), We don't need to write this, I will explain in the bottom lines
    end

    #as you can see here we did not call ' guess ' variable, nor 'guesses' at the end.
    #Why? because the Conditional Statements will return a value(s), and the ' method '  will return that value.

                                     # TRANSLATION 
    def my_guesses(my_name, gueeses) #<-- When we call the method, we have to write two parameters like this.... my_guess("Anthony", "friend")
        if guesses                   #<-- If there is guesses
            "Juan"                   # <-- give me this String.... NOTICE we didn't have to set it to a variable.
        else
            "Ordaz"                  #<-- If there is No guesses, print this String.
        end
                                     #<-- We don't have to write guesses variable to get something in return. The " Method" does it for us
    end

    my_guesses("Anthony", "friend") #<-- if I call the method like this.

    # Since I pass "friend " in the parameter, it means that there are guesses, so it will return
        "Juan"

    #IMPORTANT - if you don't pass two parameters in to the " method " it will return an error.

    my_guesses("Juan") #<-- this will return an error, becuase is expecting two parameters, which is "friend" as the guesses.


# Case Statement also return values.

                                                    # TRANSLATION 
    guess = case guesses                            #<--  here we are evaluating guesses.
    when "juan"                                     #<-- If the guesses is equals to  "Juan", than
        "Is a Rails Developer"                      #<-- return this string, and set it equal to guess
    when "ruby"                                     #<-- if the guesses is equal to "ruby"
        "Juan Loves Ruby"                           #<-- return this value, and set it equal to guess
    else                                            #<-- so if there is no guesses
        "Random"                                    #<-- set guess to "Random"
    end

#Using Ranges.
                                                    # TRANSLATION 
    give_me_numbers = case numbers.count            #<-- here it does the samething. Let's pretend 'numbers' is variable with a value, so we count those values, can can say, for example," number.count = 10 "
        when 1..4                                   #<-- This is going to be skipped
            "few"
        when 5..9                                   #<-- This is going to be skipped
            "a little more"
        else                                        #<-- here is saying after greater than 9
            "a lot"                                 #<-- Since, numbers.count =  10 This will be printed
        end

# We can use Case with Reg Expressions.

# we can use " then " with Case conditional.
                                                                # TRANSLATION 
   give_me_numbers = case numbers.count                         # here it does the samething. Let's pretend 'numbers' is variable with a value, so we count those values, can can say, for example," number.count = 10 "
        when 1..4                 then "few"                    #This is going to be skipped"few"
        when 5..9                 then "a little more"          #This is going to be skipped
        else                      "a lot"                       # here is saying after greater than 9"a lot"                                                 #<-- Since, numbers.count =  10 This will be printed
        end
