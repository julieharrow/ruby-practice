puts 'Please enter a 4 digit staring year: '
startYear = gets.to_i
puts 'Please enter a 4 digit ending year: '
endYear = gets.to_i
calcYear = startYear

puts 'The following are leap years between ' + startYear.to_s + ' and ' + endYear.to_s + ': '

if startYear < endYear
  
  while calcYear <= endYear
    if calcYear % 4 == 0
      puts calcYear
    else
    end
  calcYear = calcYear+1
  end

elsif endYear < startYear
  while calcYear >= endYear
   
    if calcYear % 4 == 0
      puts calcYear
    else
    end
  calcYear = calcYear-1
  end

end
