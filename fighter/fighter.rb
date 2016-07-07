class Fighter
  attr_reader :name
  attr_accessor :health, :power
  def initialize(name, health, power)
    @name = name
    @health = health
    @power = power
  end

  def attack(enemy)
    enemy.lose_health(self.power,enemy.health)
  end

  def lose_health(enemy_power,health)
    self.health-=enemy_power
  end

end

boxer1 = Fighter.new("Rocky", 110, 15)
boxer2 = Fighter.new("Rob", 100, 5)
boxer1.attack(boxer2)
boxer2.attack(boxer1)
