def conv_lbs_to_kilos(pounds)
  kilos = pounds/2.2
  kilos.round(2)
end

def length_of_string()
  word = gets.chomp
  length = word.length
end


def reverse_string()
  word = gets.chomp
  reverse = word.reverse
end


puts "130 pounds is equivalent to #{conv_lbs_to_kilos(130)} kilos"
puts "Gimme a word:"
puts "The length of your word is #{length_of_string()}."
puts "Gimme a word:"
puts "Your word backward is #{reverse_string()}."
