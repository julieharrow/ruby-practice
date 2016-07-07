class Inventory
  @@owner = 'Julie'
  attr_accessor :name, :brand

  def initialize(name, brand)
    @name, @brand = name, brand
  end
  # necessary initialization methods for class variables...vv (the following can also be written as def Inventory.owner=..., but convention is to use 'self')
  def self.owner=(new_owner_name)
    @@owner = new_owner_name
  end
  def self.owner
    @@owner
  end
end

my_stuff = Inventory.new('Macbook Pro', 'Apple')
puts Inventory.owner
Inventory.owner = "Jukebox"
puts Inventory.owner
