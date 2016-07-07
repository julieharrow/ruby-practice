# The following code snippet versions are equivalent in meaning. One takes 6 lines of code; the other takes 23 lines.

# SHORT VERSION
class User
  attr_accessor :name, :username, :password
  def initialize(name, username, password)
    @name, @username, @password = name, username, password
  end
end

# LONG VERSION
class User
  def initialize(name, username, password)
    @name, @username, @password = name, username, password
  end
  def who
    @name
  end
  def username
    @username
  end
  def pw
    @password
  end
  def name=(input)
    @name=input
  end
  def username=(input)
    @username=input
  end
  def password=(input)
    @password=input
  end
end

new_user = User.new("Julie", "julie.harrow", "2468")
