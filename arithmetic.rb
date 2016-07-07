# def add(num1,num2)
#   num1+num2
# end
# def subtract(num1,num2)
#   num1-num2
# end
# def multiply(num1,num2)
#   num1*num2
# end
# def divide(num1,num2)
#   num1/num2
# end
#
# puts "First number:"
# num1 = gets.chomp.to_i
# puts "'add' OR 'subtract' OR 'multiply' OR 'divide'"
# function = gets.chomp.downcase
# puts "Second number:"
# num2 = gets.chomp.to_i
#
# # function that sends a function!
# puts send(function, num1, num2)

# Even better version below...
array_of_nums = []
puts "First number:"
array_of_nums<<gets.chomp.to_i
puts "'+' OR '-' OR '*' OR '/'"
function = gets.chomp.to_sym
puts "Second number:"
array_of_nums<<gets.chomp.to_i
puts array_of_nums.reduce(function)
