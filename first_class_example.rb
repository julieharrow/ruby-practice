class Person
  attr_accessor :name, :age # this line is equivalent to lines 3-4
  attr_reader :name, :age # this is equivalent to lines 11-16
  attr_writer :name # this is equivalent to lines 19-21
  def initialize(name, age)
    # the following are instance variables - can be used within every method in the class
    @name = name
    @age = age
  end
  # the following are 'getter' methods
  def name
    @name
  end
  def age
    @age
  end
  # --------getter methods^
  # the following are 'setter' methods.  the following can be written alternatively as new_name(input) if the calling syntax is the same*
  def name=(input)
    @name=input
  end


my_profile = Person.new("Julie",25)
my_profile.birthday_party
  # the following can be written alternatively as my_profile.name("Jukebox") if the method syntax is the same, but due to the attr_writer shortcut that we use (and it takes = as convention), best practice is to always use an equal signe
my_profile.name = "Jukebox"
puts "Hi, I am #{my_profile.name} and I am #{my_profile.age} years old."
