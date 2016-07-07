#Bear is the subclass, Fighter is the superclass
require_relative 'fighter' #pull in the filename minus filetype
class Bear < Fighter
  attr_reader :fur
  #have to initialize the instance variables here because Bear class takes an additional variable - fur
  def initialize(name,health,power,fur)
    super(name,health,power)  #looks for initialize from 'fighter' and inherits all that @ information as well as the attr_ commands
    @fur = fur
  end
  def attack(enemy)
    puts "Rawr!!"
    enemy.lose_health(self.power,enemy.health)
  end

end

bear = Bear.new("Billy",100,100,"long")
