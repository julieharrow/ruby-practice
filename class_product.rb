class Product
  def initialize(name, type, version, inventory_amount)
    @name, @type, @version, @inventory= name, type, version, inventory_amount
  end
  def who
    @name
  end
  def type
    @type
  end
  def version
    @version
  end
  def inventory
    @inventory
  end
  def purchase=(amount)
    if amount > @inventory
      puts "Sorry, we only have #{@inventory} in stock.  We will have to backorder your remainding #{amount - @inventory} orders."
    else
      puts "Your order for #{amount} is confirmed."
      @inventory -= amount
    end
  end
end

new_product = Product.new("KitchenAid", "Mixer", "Artisan 5 Quart", 12)
puts new_product.who
puts new_product.type
puts new_product.version
puts new_product.inventory

puts "I want to purchase 14 items."
new_product.purchase = 14
