def roll_dice(num_rolls, num_dice)
 (1..num_rolls).each do |roll|
    (1..num_dice).each do |dice|
      puts "Roll: #{roll} Dice #{dice}: #{rand(1..6)}"
    end
  end
end

roll_dice(2,2)


# OR


die = [1,2,3,4,5,6]
2.times do
  puts die.shuffle!.sample
end
