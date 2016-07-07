movies = { 
    'Harry Potter'=>10,
    'The Holiday'=>8,
    'Inception'=>7
}
puts 'Would you like to add, update, display or delete a movie?'
choice = gets.chomp.downcase

case choice

when "add"
puts 'Which movie would you like to add?'
title = gets.chomp.to_sym
puts 'What is this movie\'s rating?'
rating = gets.chomp.to_i
if movies[title] == nil
    movies[title]=rating
    puts "Added!"
    puts movies
else
    puts 'This movie already exists'
end


when "update"
puts 'Which movie would you like to update?'
title = gets.chomp
if movies[title] == nil
    puts 'Error - movie does not exist'
else
    puts 'What is this movie\'s rating?'
    rating = gets.chomp.to_i
    movies[title]=rating
    puts "Updated!"
    puts movies
end

when "display"

movies.each do |movie,rating|
    puts "#{movie}: #{rating}"
end

when "delete"
puts 'Which movie would you like to delete?'
title = gets.chomp
if movies[title] == nil
    puts 'Error - movie does not exist'
else
    movies.delete(title)
    puts movies
end

else
    puts "Error!"
end