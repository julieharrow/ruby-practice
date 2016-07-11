

class Player
  attr_accessor :x_or_o,:one_or_two
  def initialize(x_or_o,one_or_two)
    @x_or_o, @one_or_two = x_or_o, one_or_two
  end

  def pick_space
    puts "Player #{@one_or_two} - row 1, 2, or 3?"
    row = gets.chomp.to_i
    puts "Player #{@one_or_two} - column 1, 2, or 3?"
    column = gets.chomp.to_i
    return row-1,column-1
  end
  
end
