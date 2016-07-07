student_names = %w[julie emily josh erik peter baker]
teacher_names = %w[walid rob]

puts "What is your first name?"
name = gets.chomp.downcase

if student_names.include?(name)
  puts "Hey #{name.capitalize}"
else puts "Good Morning, Mr.#{name.capitalize}"
end
