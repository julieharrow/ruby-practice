require_relative 'player'

class Board
  attr_reader :player1, :player2
  attr_accessor :spaces

  def initialize(player1,player2,spaces)
    @player1,@player2,@spaces=player1,player2,spaces
  end

  def display_board
    puts "#{@spaces[0][0]} | #{@spaces[0][1]} | #{@spaces[0][2]}"
    puts "----------"
    puts "#{@spaces[1][0]} | #{@spaces[1][1]} | #{@spaces[1][2]}"
    puts "----------"
    puts "#{@spaces[2][0]} | #{@spaces[2][1]} | #{@spaces[2][2]}"
  end

  def pick_x_or_o
    puts "Player 1, X or O?"
    input = gets.chomp.upcase
    if input == "X"
      player1_pick = "X"
      puts "Player 2, that makes you Os!"
      player2_pick = "O"
    elsif input == "O"
      player1_pick = "O"
      puts "Player 2, that makes you Xs!"
      player2_pick = "X"
    else
      pick_x_or_o
    end
    return player1_pick,player2_pick
  end

  def check_space(row,column,x_or_o)
    if @spaces[row][column] == "X" || @spaces[row][column] == "O"
      puts "Taken!"
    else
      @spaces[row][column] = x_or_o
    end
  end


end




player1 = Player.new("",1)
player2 = Player.new("",2)
board = Board.new(player1,player2,[[" "," "," "],[" "," "," "],[" "," "," "]])
player1_pick,player2_pick = board.pick_x_or_o
player1.x_or_o = player1_pick
player2.x_or_o = player2_pick
board.display_board
taken = "Taken!"
until taken != "Taken!"
  row,column = player1.pick_space
  taken = board.check_space(row,column,player1.x_or_o)
end
board.display_board
taken = "Taken!"
until taken != "Taken!"
  row,column = player2.pick_space
  taken = board.check_space(row,column,player2.x_or_o)
end
board.display_board
