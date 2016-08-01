def fizz_buzz(max)
  (1..max).each do |i|
    if i%5==0
      puts "FizzBuzz"
    elsif i%5==0
      puts "Fizz"
    elsif i%3==0
      puts "Buzz"
    else puts i
    end
  end
end

fizz_buzz(100)
