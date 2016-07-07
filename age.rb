time = Time.new
puts "Now:  "
puts time

puts "What year were you born?"
year = gets.chomp

puts "What month were you born?"
month = gets.chomp

puts "What day were you born?"
day = gets.chomp

puts "What hour were you born?"
hour = gets.chomp

puts "What minute were you born?"
minute = gets.chomp

puts "Your were born: "
birth = Time.gm(year, month, day, hour, minute)
ageSeconds = time - birth
age = (ageSeconds - (ageSeconds%(365*24*60*60)))/(365*24*60*60)
puts "Today you are #{age} years old."

birthPlus1B = birth + 1000000000
puts
puts "On #{birthPlus1B} you will be 1 billion seconds old."
