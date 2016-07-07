def fizz_buzz(num)
  (1..num).each do |i|
    if i%3==0 && i%5==0
      puts "#{i}: FIZZ-BUZZ!"
    elsif i%3==0
      puts "#{i}: FIZZ!"
    elsif i%5==0
      puts "#{i}: BUZZ!"
    else puts i
    end
  end
end


puts "Call the fizz-buzz function on a range of numbers from 1 to what?"
range = gets.chomp.to_i
fizz_buzz(range)
