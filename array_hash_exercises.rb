# Example 00#

cars = {"civic"=>"Honda", "cr-v"=>"Honda"}
puts "What type of car do you drive?"
car = gets.chomp.downcase

puts "Oh, you drive a #{car}? That's a #{cars[car]} right?"

# Example 00#

nums = []
5.times do
  puts "Please enter a number from 1 to 10:"
  number = gets.chomp.to_i
  nums<<number
end

puts "The sum of these numbers is #{nums.inject(:+)}"
puts "The product of these numbers is #{nums.reduce(:*)}"
puts "The max of these numbers is #{nums.max}"
puts "The max of these numbers is #{nums.min}"

# Example 00#

animal_array = %w[elephant giraffe duck lion monkey]

animal_array.each do |animal|
  puts animal
end

fave_animal = "elephant"
animal_sound = "trumpet"

animal_array.each do |animal|
  if animal == fave_animal
    puts "I love #{fave_animal}s and they say '#{animal_sound}'"
  else puts animal
  end
end

# Example 00#

my_hash = {"Name"=>"Julie","Age"=>25,"Hometown"=>"Bellport", "Favorite Food"=>"Avocado"}

my_hash.each do |key, value|
  if key == "Name"
    puts "My name is #{value} - "
  end
  if key == "Age"
    puts "I am #{value}-years-old"
  end
  if key == "Hometown"
    puts "from #{value}"
  end
  if key == "Favorite Food"
    puts "and my favorite food is #{value}."
  end
end
