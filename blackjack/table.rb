$deck = [
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
$deck_values = {
'2 of Hearts'=>2, '2 of Diamonds'=>2, '2 of Spades'=>2, '2 of Clubs'=>2,
'3 of Hearts'=>3, '3 of Diamonds'=>3, '3 of Spades'=>3, '3 of Clubs'=>3,
'4 of Hearts'=>4, '4 of Diamonds'=>4, '4 of Spades'=>4, '4 of Clubs'=>4,
'5 of Hearts'=>5, '5 of Diamonds'=>5, '5 of Spades'=>5, '5 of Clubs'=>5,
'6 of Hearts'=>6, '6 of Diamonds'=>6, '6 of Spades'=>6, '6 of Clubs'=>6,
'7 of Hearts'=>7, '7 of Diamonds'=>7, '7 of Spades'=>7, '7 of Clubs'=>7,
'8 of Hearts'=>8, '8 of Diamonds'=>8, '8 of Spades'=>8, '8 of Clubs'=>8,
'9 of Hearts'=>9, '9 of Diamonds'=>9, '9 of Spades'=>9, '9 of Clubs'=>9,
'10 of Hearts'=>10, '10 of Diamonds'=>10, '10 of Spades'=>10, '10 of Clubs'=>10,
'Jack of Hearts'=>10, 'Jack of Diamonds'=>10, 'Jack of Spades'=>10, 'Jack of Clubs'=>10,
'Queen of Hearts'=>10, 'Queen of Diamonds'=>10, 'Queen of Spades'=>10, 'Queen of Clubs'=>10,
'King of Hearts'=>10, 'King of Diamonds'=>10, 'King of Spades'=>10, 'King of Clubs'=>10,
'Ace of Hearts'=>11, 'Ace of Diamonds'=>11, 'Ace of Spades'=>11, 'Ace of Clubs'=>11
}

require_relative 'player'

class Table
  attr_accessor :house, :player_list
  def initialize(house, player_list)
    @house, @player_list = house, player_list
  end

  def shuffle_deck(deck)
    deck.shuffle!
  end

  def build_player_set(num_players)
    (1..num_players).each do |x|
      puts "What is player #{x}'s name?"
      name = gets.chomp.capitalize.strip
      puts "What is player #{x}'s bet?"
      bet = gets.chomp.to_i
      player_list<<Player.new(name, bet, 0, [], 0,"")
    end
    return player_list
  end

  def deal_to_players()
    @player_list.each {|x| x.hit}
  end

  def mid_status()
    @player_list.each do |x|
      if x.status == "idle" || x.score > 21
        x.status = "idle"
      else
        x.status = "active"
      end
    end
  end

  def end_status()
    @player_list.each do |x|
      if x.score == 21 && house.score != 21
        x.status = "blackjack"
      elsif x.score > 21
        x.status = "bust"
      elsif x.score < 21 && house.score < 21 && x.score < house.score
        x.status = "lose"
      elsif x.score < 21 && (house.score < x.score || house.score > 21)
        x.status = "win"
      elsif house.score == house.score
        x.status = "push"
      end
    end
  end

  def report()
    puts "House finishes with #{@house.hand} for a score of #{@house.score}"
    @player_list.each do |x|
      puts "#{x.name} #{x.status}s with #{x.score} --> $#{x.bank} in the bank."
    end
  end
end

# build the table
house = Player.new("House", 0, 0, [], 0,"")
table = Table.new(house,[])
table.shuffle_deck($deck)
puts "How many players?"
table.player_list = table.build_player_set(gets.chomp.to_i)
# deal everyone's first hand
2.times do
  table.deal_to_players()
end
house.hit
# hit or stay before seeing house's second card
table.player_list.each do |x|
  puts "#{x.name}, hit or stay?"
  command = gets.chomp.downcase
  if command == "hit"
    x.hit
    table.mid_status()
  else
    x.set_status_idle
  end
end
# deal house's second card
house.hit
# hit or stay unitl complete?
table.player_list.each do |x|
  command = "hit"
  until command == "stay" || x.status == "idle"
    puts "#{x.name}, hit or stay?"
    command = gets.chomp.downcase
    if command == "hit"
      x.hit
      table.mid_status()
    end
  end
end
# house runs down their hand
until house.score >= 17 || house.status == "bust"
  house.hit
end
# report out the results
table.end_status()
table.player_list.each {|x| x.cash_out()}
table.report()
