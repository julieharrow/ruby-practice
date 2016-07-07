puts "
[example 001]"
5.times do
  print "I think I can "
end

puts "
[example 002]"
puts "Are you famous?"
answer = gets.chomp.downcase
if answer == "yes"
  10.times do
    print "OH MY GOD!"
  end
else
  3.times do
    print "Stranger. Danger!  "
  end
end
