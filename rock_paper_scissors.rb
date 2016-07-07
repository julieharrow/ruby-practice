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

if (computer_selection=='rock' && user_selection=='rock') || (computer_selection=='paper' && user_selection=='paper') || (computer_selection=='scissors' && user_selection=='scissors')
  puts "Tie"
elsif (computer_selection=='paper' && user_selection=='rock') || (computer_selection=='scissors' && user_selection=='paper') || (computer_selection=='scissors' && user_selection=='paper') || (computer_selection=='rock' && user_selection=='scissors')
  puts "You lose..."
elsif (computer_selection=='scissors' && user_selection=='rock') || (computer_selection=='rock' && user_selection=='paper') || (computer_selection=='paper' && user_selection=='scissors')
  puts "You win!"
end
