puts "[example 001]"
puts "Are you a dog or a cat?"
animal_type = gets.chomp.downcase
if animal_type == "dog"
  puts "Ruff"
elsif animal_type == "cat"
  puts "Meow"
else puts "unexpeted entry"
end

# ----

puts "[example 002]"
puts "Guess a number between -1 and 101"
rand_number = rand(101)
puts "rand_number: #{rand_number}"
guess = gets.chomp.to_i
if guess == rand_number
  puts "Wow! Yeah, that is exactly the right number!"
elsif guess <= rand_number+5 && guess >= rand_number-5
  puts "Yeah, #{guess} is close enough to #{rand_number}. Great guess!"
else puts "Nope - not even close!"
end
