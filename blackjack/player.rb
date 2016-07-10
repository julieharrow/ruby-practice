class Player
  attr_accessor :name, :bet, :bank, :hand, :score, :status
  def initialize(name, bet, bank, hand, score, status)
    @name, @bet, @bank, @hand, @score, @status = name, bet, bank, hand, score, status
  end

  def hit
    @hand<<$deck.pop
    @score += $deck_values[@hand.last]
    print "#{@name}'s hand:  #{@hand}..."

    if (@hand.last == 'Ace of Hearts' || @hand.last == 'Ace of Diamonds' || @hand.last == 'Ace of Spades' || @hand.last == 'Ace of Clubs') && @name == 'House'
      if @score > 10
        puts "House chose for the Ace to count as 1"
        @score -= 10
      else
        random_pick = rand(1..2)
        if random_pick == 1
          puts "House chose for the Ace to count as 1"
          @score -= 10
        elsif random_pick == 2
          puts "House chose for the Ace to count as 11"
        end
      end
    elsif @hand.last == 'Ace of Hearts' || @hand.last == 'Ace of Diamonds' || @hand.last == 'Ace of Spades' || @hand.last == 'Ace of Clubs'
      puts "#{@name}, would you like for your Ace to count as 1 or 11?..."
      if gets.chomp.to_i == 1
        @score -= 10
      end
    end

    if @score > 21 && @name != 'House'
      @status = "idle"
      puts "#{@name}, your score is #{@score}.  That is a bust!"
    elsif @score <= 21 && @name != 'House'
      puts "#{@name}, your score is #{@score}.  You need #{21-@score} points to reach 21."
    else
      puts
    end
  end

  def set_status_idle
    @status = "idle"
  end

  def cash_out()
    if @status == "blackjack"
      @bank = @bet*2.5
    elsif @status == "bust" || @status == "lose"
      @bank = 0 - @bet
    elsif @status == "win"
      @bank = @bet*2
    elsif @status == "push"
      @bank = @bet*1
    end
  end
end
