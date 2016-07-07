def oldSchoolRomanNumerals integer
  numThousandths = integer/1000
  remainder = integer%1000
  numFiveHundreds = remainder/500
  remainder = integer%500
  numHundreds = remainder/100
  remainder = integer%100
  numFifties = remainder/50
  remainder = integer%50
  numTens = remainder/10
  remainder = integer%10
  numFives = remainder/5
  remainder = integer%5
  numOnes = remainder
  
  puts 'M'*numThousandths+
  'D'*numFiveHundreds+
  'C'*numHundreds+
  'L'*numFifties+
  'X'*numTens+
  'V'*numFives+
  'I'*numOnes
end

def modernRomanNumerals integer
  numThousandths = integer/1000
  remainder = integer%1000
  numFiveHundreds = remainder/500
  remainder = integer%500
  numHundreds = remainder/100
  remainder = integer%100
  numFifties = remainder/50
  remainder = integer%50
  numTens = remainder/10
  remainder = integer%10
  numFives = remainder/5
  remainder = integer%5
  numOnes = remainder
  
  if numHundreds==4 && numFiveHundreds==1
    hPlace = 'C'+'M'
  elsif numHundreds==4 && numFiveHundreds==0
    hPlace = 'C'+'D'
  else
    hPlace = 'D'*numFiveHundreds+'C'*numHundreds
  end

  if numTens==4 && numFifties==1
    tPlace = 'X'+'C'
  elsif numTens==4 && numFifties==0
    tPlace = 'X'+'L'
  else
    tPlace = 'L'*numFifties+'X'*numTens
  end

  if numOnes==4 && numFives==1
    oPlace = 'I'+'X'
  elsif numOnes==4 && numFives==0
    oPlace = 'I'+'V'
  else
    oPlace = 'V'*numFives+'I'*numOnes
  end

  puts 'M'*numThousandths+hPlace+tPlace+oPlace

end


input = gets.to_i
puts 'old school numerals:'
puts oldSchoolRomanNumerals(input)
puts
puts 'modern numerals:' 
puts modernRomanNumerals(input)

