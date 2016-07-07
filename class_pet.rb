# the following includes a default attribute (name='Marley') AND named parameter (sound: 'woof') - each require a different syntax when assigning a new pet, see line 18

class Pet
  attr_reader :breed, :sound, :age
  attr_writer :age
  attr_accessor :name

  def initialize(name, breed='Mix', age, sound:"woof")
    @name = name
    @age = age
    @sound = sound
    @breed = breed
  end
end
dog = Pet.new("Stella", 5) # in this case, because breed has default a value, dog will assume the breed 'Mix', and assign the other variables that do not have default
dog2 = Pet.new("Stella","Maine Coon", 5, sound:'meow') # in this case, because there are 4 parameters, dog will adopt the newly assigned name 'Stella' and the breed 'Maine Coon'.  These instance variables do not have to maintain data types - could type a number for name, for example.
puts dog.name
puts dog.breed
puts dog.age
puts dog.sound

puts dog2.name
puts dog2.breed
puts dog2.age
puts dog2.sound
