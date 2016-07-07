class Team

  attr_accessor :name, :city
  @@league = "MLB"
  def initialize(name, brand)
    @name = name
    @brand = brand
  end
  def self.league
    @@league
  end
  def self.league=(new_name)
    @@league=new_name
  end
end


puts Team.league
puts Team.league = "New League"
