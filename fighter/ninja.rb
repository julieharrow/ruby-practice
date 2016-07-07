
require_relative 'fighter'
require_relative 'bear'

class Ninja < Fighter
# do no have to initialize the instance variables here because Ninja class takes all the same variables - nothing to override or add
  def attack(enemy)
    puts "...silence"
    enemy.lose_health(self.power,enemy.health)
  end
end

ninja = Ninja.new("Jet Li", 85, 10)
bear = Bear.new("Yogi",100,15,"brown")
ninja.attack(bear)
