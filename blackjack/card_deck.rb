require_relative 'blackjack_player'
require_relative 'blackjack_dealer'

class Deck
  attr_accessor :deck, :deck_values
  def initialize(deck,deck_values)
    @deck,@deck_values = deck, deck_values
  end

  def shuffle deck, shuffled_deck
    deck
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

end

# define the cards in the deck
@deck = [
'2 of Hearts', '2 of Diamonds', '2 of Spades', '2 of Clubs',
'3 of Hearts', '3 of Diamonds', '3 of Spades', '3 of Clubs',
'4 of Hearts', '4 of Diamonds', '4 of Spades', '4 of Clubs',
'5 of Hearts', '5 of Diamonds', '5 of Spades', '5 of Clubs',
'6 of Hearts', '6 of Diamonds', '6 of Spades', '6 of Clubs',
'7 of Hearts', '7 of Diamonds', '7 of Spades', '7 of Clubs',
'8 of Hearts', '8 of Diamonds', '8 of Spades', '8 of Clubs',
'9 of Hearts', '9 of Diamonds', '9 of Spades', '9 of Clubs',
'10 of Hearts', '10 of Diamonds', '10 of Spades', '10 of Clubs',
'Jack of Hearts', 'Jack of Diamonds', 'Jack of Spades', 'Jack of Clubs',
'Queen of Hearts', 'Queen of Diamonds', 'Queen of Spades', 'Queen of Clubs',
'King of Hearts', 'King of Diamonds', 'King of Spades', 'King of Clubs',
'Ace of Hearts', 'Ace of Diamonds', 'Ace of Spades', 'Ace of Clubs',
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
'Jack of Hearts' => 10, 'Jack of Diamonds' => 10, 'Jack of Spades' => 10, 'Jack of Clubs' => 10,
'Queen of Hearts' => 10, 'Queen of Diamonds' => 10, 'Queen of Spades' => 10, 'Queen of Clubs' => 10,
'King of Hearts' => 10, 'King of Diamonds' => 10, 'King of Spades' => 10, 'King of Clubs' => 10,
'Ace of Hearts' => 11, 'Ace of Diamonds' => 11, 'Ace of Spades' => 11, 'Ace of Clubs' => 11
}

# shuffle the deck and reassign the variable
deck = shuffle(deck, [])

#
