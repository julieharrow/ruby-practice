require_relative 'blackjack_table'

class Dealer < 'blackjack_table'
  attr_reader :hand, :score, :status
  def initialize(name,bet,hand,score,bank,status)
    @name,@bet,@hand,@score,@bank,@status = name,bet,hand,score,bank,status
  end
end



def shuffle deck, shuffled_deck
  if deck == []
    return shuffled_deck
  end
  chosen_card = deck.fetch(rand(deck.length-1))
  shuffled_deck<<chosen_card
  deck -= [chosen_card]
  shuffle(deck, shuffled_deck)
end

def deal(deck, hand, num_cards)
  (0..num_cards-1).each {|i| hand<<deck[i]}
  deck.shift(num_cards)
  return deck, hand
end

def value_of_hand(hand,deck_values)
  value = 0
  num_cards = hand.length
  (0..num_cards-1).each do |x|
    value += deck_values[hand[x]]
    if value > 21 && (hand.include?('A of Hearts') || hand.include?('A of Diamonds') || hand.include?('A of Spades') || hand.include?('A of Clubs'))
      value -= 10
    end
  end
  return value
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

# define the cards in the deck
deck = [
'2 of Hearts', '2 of Diamonds', '2 of Spades', '2 of Clubs',
'3 of Hearts', '3 of Diamonds', '3 of Spades', '3 of Clubs',
'4 of Hearts', '4 of Diamonds', '4 of Spades', '4 of Clubs',
'5 of Hearts', '5 of Diamonds', '5 of Spades', '5 of Clubs',
'6 of Hearts', '6 of Diamonds', '6 of Spades', '6 of Clubs',
'7 of Hearts', '7 of Diamonds', '7 of Spades', '7 of Clubs',
'8 of Hearts', '8 of Diamonds', '8 of Spades', '8 of Clubs',
'9 of Hearts', '9 of Diamonds', '9 of Spades', '9 of Clubs',
'10 of Hearts', '10 of Diamonds', '10 of Spades', '10 of Clubs',
'J of Hearts', 'J of Diamonds', 'J of Spades', 'J of Clubs',
'Q of Hearts', 'Q of Diamonds', 'Q of Spades', 'Q of Clubs',
'K of Hearts', 'K of Diamonds', 'K of Spades', 'K of Clubs',
'A of Hearts', 'A of Diamonds', 'A of Spades', 'A of Clubs',
]

# define the value for each card in the deck
deck_values = {
'2 of Hearts' => 2, '2 of Diamonds' => 2, '2 of Spades' => 2, '2 of Clubs' => 2,
'3 of Hearts' => 3, '3 of Diamonds' => 3, '3 of Spades' => 3, '3 of Clubs' => 3,
'4 of Hearts' => 4, '4 of Diamonds' => 4, '4 of Spades' => 4, '4 of Clubs' => 4,
'5 of Hearts' => 5, '5 of Diamonds' => 5, '5 of Spades' => 5, '5 of Clubs' => 5,
'6 of Hearts' => 6, '6 of Diamonds' => 6, '6 of Spades' => 6, '6 of Clubs' => 6,
'7 of Hearts' => 7, '7 of Diamonds' => 7, '7 of Spades' => 7, '7 of Clubs' => 7,
'8 of Hearts' => 8, '8 of Diamonds' => 8, '8 of Spades' => 8, '8 of Clubs' => 8,
'9 of Hearts' => 9, '9 of Diamonds' => 9, '9 of Spades' => 9, '9 of Clubs' => 9,
'10 of Hearts' => 10, '10 of Diamonds' => 10, '10 of Spades' => 10, '10 of Clubs' => 10,
'J of Hearts' => 10, 'J of Diamonds' => 10, 'J of Spades' => 10, 'J of Clubs' => 10,
'Q of Hearts' => 10, 'Q of Diamonds' => 10, 'Q of Spades' => 10, 'Q of Clubs' => 10,
'K of Hearts' => 10, 'K of Diamonds' => 10, 'K of Spades' => 10, 'K of Clubs' => 10,
'A of Hearts' => 11, 'A of Diamonds' => 11, 'A of Spades' => 11, 'A of Clubs' => 11
}

# shuffle the deck and reassign the variable
deck = shuffle(deck, [])

# asks number of players
num_players = 0
until num_players > 0
  puts "How many players?"
  num_players = gets.chomp.to_i
end

# builds player arrays
player_names = [] # array of player names
player_bets = [] # array of player bets
player_hands = [] # array of player hands, which are arrays of cards
player_scores = [] # array of player scores
player_banks = [] # array of player banks
player_statuses = [] # array of player statuses

(0..num_players-1).each do |x|
  player_names[x] = ""
  player_bets[x] = 0
  until player_names[x] != ""
    puts "What is player #{x+1}'s name?"
    player_names[x]
    player_names[x] = gets.chomp.capitalize.strip
  end
  until player_bets[x] > 0
    puts "What is player #{x+1}'s bet?"
    player_bets[x] = gets.chomp.to_i
  end
  # deals the players' first hands in the background
  deck, player_hands[x] = deal(deck,[],2)
  x += 1
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
