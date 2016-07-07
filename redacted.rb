puts "Input script text: "
text = gets.chomp
puts "Input words to redact: "
redact = gets.chomp
words = text.split(" ")

words.each do |word|
    if word == redact
        print "REDACTED "
    else
        print word + " "
    end
end
