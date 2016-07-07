#defines a method called 'greeter' that yields. when called and passed the proc, 'phrase', the greeter method prints out "hello there!"

def greeter
    yield 
end

phrase = Proc.new do
    puts "Hello there!"
end

print greeter(&phrase)



#convert symbols to procs using the '&'

numbers_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

strings_array = numbers_array.map(&:to_s)



#creates a lambda, symbol_filter, that takes one parameter and checks to see if that parameter .is_a? Symbol.  
#create a new variable called symbols, and stores the result of calling my_array.select and passing it the lambda.

my_array = ["raindrops", :kettles, "whiskers", :mittens, :packages]

symbol_filter = lambda {|param| param.is_a? Symbol}

symbols = my_array.select(&symbol_filter)