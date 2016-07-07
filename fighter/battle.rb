require_relative 'bear'
require_relative 'ninja'
class Battle
  attr_reader :fighter1, :fighter2
  def initialize(fighter1,fighter2)
    @fighter1=fighter1
    @fighter2=fighter2
  end
  def fight
    @fighter1.attack(@fighter2)
    @fighter2.attack(@fighter1)
    battle_status
    until @fighter1.health <= 0 || @fighter2.health <= 0
      fight
    end
  end
  def battle_status
    puts "#{@fighter1.name} has #{@fighter1.health} health left."
    puts "#{@fighter2.name} has #{@fighter2.health} health left."
  end
end

bear = Bear.new("Barry",100,12,"white")
ninja = Ninja.new("Jackie Chan",100,10)
war = Battle.new(bear, ninja)
war.fight
war.fight
war.fight
