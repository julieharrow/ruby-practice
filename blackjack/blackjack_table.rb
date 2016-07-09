require_relative 'blackjack_player'
require_relative 'blackjack_dealer'

class Table
  attr_reader :deck_values
  attr_accessor :deck, :player, :dealer
  def initialize(deck,deck_values)
    @deck,@deck_values = deck, deck_values
  end





def asses_the_hand(hand_value,house_value)
  if hand_value == 21 && house_value != 21
    "Blackjack"
  elsif hand_value > 21
    "Bust"
  elsif hand_value < 21 && house_value < 21 && hand_value < house_value
    "Lose"
  elsif hand_value < 21 && (house_value < hand_value || house_value > 21)
    "Win"
  elsif house_value == hand_value
    "Push"
  end
end

def cash_out(status,bet,bank)
  if status == "Blackjack"
    bank = bet*2.5
  elsif status == "Bust" || status == "Lose"
    bank = 0 - bet
  elsif status == "Win"
    bank = bet*2
  elsif status == "Push"
    bank = bet*1
  end
  return bank
end




# deals the house hand and displays the first hands
deck, house_hand = deal(deck,[],2)
puts
puts "Okay. Dealing..."
(0..num_players-1).each do |x|
  puts "#{player_names[x]}'s hand #{player_hands[x]}"
  x += 1
end
puts "...And the house's first card #{house_hand[0]}"

# determine the value of each players' hand
(0..num_players-1).each do |x|
  player_scores[x] = value_of_hand(player_hands[x],deck_values)
  x += 1
end

# determines the value of the house's hand
house_score = value_of_hand(house_hand,deck_values)

# choices per player
(0..num_players-1).each do |x|
  player_statuses[x] = asses_the_hand(player_scores[x],house_score)
  response = "hit"
  while response != "stay"
    if player_scores[x] == 21
      puts "You struck 21! - I'm guessing that you will stay."
      response = "stay"
    else puts "#{player_names[x]}, would you like to hit or stay?"
    end
    if response == "hit"
      response = gets.chomp.downcase
    end
    until response == "hit" || response == "stay"
      puts "Invalid response - would you like to hit or stay?"
      response = gets.chomp.downcase
    end
    if response == "hit"
      deck, player_hands[x] = deal(deck,player_hands[x],1)
      player_scores[x] = value_of_hand(player_hands[x],deck_values)
      player_statuses[x] = asses_the_hand(player_scores[x],house_score)
      puts "#{player_names[x]}'s hand #{player_hands[x]}"
      if player_statuses[x] == "Bust"
        puts "***Bust***"
        response = "stay"
      end
    end
  end
  player_statuses[x] = asses_the_hand(player_scores[x],house_score)
  x+=1
end

# dealer plays out hand
until house_score >= 17
  deck, house_hand = deal(deck,house_hand,1)
  house_score = value_of_hand(house_hand,deck_values)
end

puts "House #{house_hand} #{house_score}"

(0..num_players-1).each do |x|
  player_statuses[x] = asses_the_hand(player_scores[x],house_score)
  player_banks[x] = cash_out(player_statuses[x],player_bets[x],player_banks[x])
  puts "#{player_names[x]} #{player_statuses[x]}s with #{player_scores[x]} $#{player_banks[x]}"
end

end
