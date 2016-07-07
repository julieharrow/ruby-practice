
# The app should have a class of Student and the student should "login" with their email and password before they can take a test. The user should be able to take the test and receive feedback on answers. Their score should be saved and printed at the end of the test. If they score under 60 they should be prompted to take the test again.

class Student
  attr_reader :score
  attr_accessor :email, :password
  def initialize(name, email, password, score)
    @name = name
    @email = email
    @password = password
    @score = score
  end

  def reset_score
    @score = 0
  end

  def question(arithmetic,correct_answer)
    puts "So, what is #{arithmetic}?"
    answer = gets.chomp.to_i
    if answer == correct_answer
      @score += 25
      puts "Correct!"
    else puts "Incorrect. The answer is #{correct_answer}."
    end
  end

end

puts "Name:"
input_name = gets.chomp
puts "Email:"
input_email = gets.chomp
puts "Password:"
input_password = gets.chomp

new_student = Student.new(input_name,input_email,input_password,0)
puts "Please take the following exam."
while new_student.score < 60
  new_student.reset_score
  new_student.question("2+2",4)
  new_student.question("5-4",1)
  new_student.question("2*6",12)
  new_student.question("2^3",8)
  puts "You earned a score of #{new_student.score}."
  if new_student.score < 60
    puts "You have to retake the test!"
    puts
  end
end
