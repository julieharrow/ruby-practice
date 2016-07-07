puts "
[example 001]"
puts "Guess a number between 1 and 100"
rand_number = rand(1..100)
puts "Hint...it is #{rand_number}."
guess = gets.chomp.to_i
if guess == rand_number
  puts "Wow! Yeah, that is exactly the right number!"
elsif guess <= rand_number+5 && guess >= rand_number-5
  puts "Yeah, #{guess} is close enough to #{rand_number}. Great guess!"
else puts "Nope - not even close!"
end

# ---

puts "
[example 002]"
puts "What is your number grade?"
grade  = gets.chomp.to_i
if grade >= 60
  puts "You passed!"
elsif grade < 60
  puts "You should take the class again."
else puts "Not a number"
end

# ---

puts "
[example 003]"

puts "Please type a number between 1 and 10:"
num = gets.chomp.to_i
while num <= 20
  puts num*2
  num+=1
end

# ---

puts "
[example 004]"

puts "Please type a number between 1 and 10:"
num = gets.chomp.to_i
while num >= 0
  puts num
  num-=1
end

# ---

puts "
[example 005]"

puts question = "Dad, can we please go to itchy scratchy land?"
dad_response = gets.chomp.downcase
until dad_response == "yes"
  puts question
  dad_response = gets.chomp.downcase
end
puts "thanks dad!"



# ---HOMEWORK---HOMEWORK---HOMEWORK---HOMEWORK---HOMEWORK---HOMEWORK---


puts "
[example 001]"
puts "Please type a number:"
num1 = gets.chomp.to_i
puts "Please type another number:"
num2 = gets.chomp.to_i
sum = num1+num2
puts "The sum of #{num1} and #{num2} is #{sum}"

# ---

puts "
[example 002]"
puts "Please type any word:"
word = gets.chomp
reverse_word = word.reverse
puts "Here is #{word} backwards: #{reverse_word}"

# ---

puts "
[example 003]"
puts "Please type any word:"
word = gets.chomp
word_length = word.length
puts "Here is the length of #{word}: #{word_length}"

# ---

puts "
[example 004]"
puts "What is your favorite color?"
color = gets.chomp.downcase
if color == "blue" || color == "green"
  puts "great color!"
else puts "really? that is your favorite color?"
end

# ---

puts "
[example 005]"
puts "Hey there!"
user_input = gets.chomp.capitalize
while user_input != "I'm a dummy"
  puts user_input
  user_input = gets.chomp.capitalize
end
puts "Yeah you are! Bye!"

# ---

puts "
[example 006]"
puts "Hey, how old are you?!"
age = gets.chomp.to_i
if age >= 21
  puts "Come on in!"
elsif age < 21 && age == 20
  puts "Sorry kid, you have another year to go before you can get into this place!"
elsif age < 20
  puts "Sorry kid, you have another #{21-age} years to go before you can get into this place!"
end

# ---

puts "
[example 007]"

def check_number(num)
  while num%1 != 0 || num< 0
    puts "No, please type an integer greater than 0:"
    num = gets.chomp.to_i
  end
  num
end

puts "Please type an integer greater than 0:"
num1 = gets.chomp.to_i
num1 = check_number(num1)
puts "Please type another integer greater than 0:"
num2 = gets.chomp.to_i
num2 = check_number(num2)
remainder = num1%num2
puts "#{num1} divided by #{num2} leaves a remainder of #{remainder}"

# ---

puts "
[example 008]"

arr = []
puts question = "Please input any number between 1 and 100"
response = gets.chomp.to_i
sum = 0
until response == 0
  sum += response
  puts question = "Please input another number between 1 and 100"
  response = gets.chomp.to_i
end
puts "The sum of all your numbers is #{sum}."

# ---

puts "
[example 009 - rock, paper, scissors]"

def introduce_the_game()
  puts "On the count of three, type either 'rock', 'paper', or 'scissors'."
  puts "Ready?! (Y/N)"
  response = gets.chomp.downcase
  until response == "y"
    puts "...Ready now?"
    response = gets.chomp.downcase
  end
  puts "1"
  puts "2"
  puts "3"
  selection = gets.chomp.downcase
  if (selection == 'rock' || selection == 'scissors' || selection == 'paper')
    return selection
  else puts "#{selection} is invalid input. Let's try this again..."
    introduce_the_game()
  end
end

user_selection = introduce_the_game()
game_array = ['rock','paper','scissors']
computer_selection = game_array[rand(0..2)]
puts "Computer picked #{computer_selection}"
puts "You picked #{user_selection}"

if computer_selection=='rock' && user_selection=='rock'
  puts "Tie"
elsif computer_selection=='paper' && user_selection=='rock'
  puts "You lose..."
elsif computer_selection=='scissors' && user_selection=='rock'
  puts "You win!"
elsif computer_selection=='rock' && user_selection=='paper'
  puts "You win!"
elsif computer_selection=='paper' && user_selection=='paper'
  puts "Tie"
elsif computer_selection=='scissors' && user_selection=='paper'
  puts "You lose..."
elsif computer_selection=='rock' && user_selection=='scissors'
  puts "You lose..."
elsif computer_selection=='paper' && user_selection=='scissors'
  puts "You win!"
elsif computer_selection=='scissors' && user_selection=='scissors'
  puts "Tie"
end
