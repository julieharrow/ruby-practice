inputArray = ['Ralph','julie','Stella','haprio','haprio','stella','Haprio','Julie','ralph']

def sortMethod array
  recursiveSortMethod(array, [])
end

def recursiveSortMethod unsortedArray, sortedArray
  if unsortedArray == []
    return sortedArray
  else
    lowercaseArray = unsortedArray.map!(&:downcase)
    smallestWord = lowercaseArray.min
    numOccurances = lowercaseArray.count(smallestWord) - 1
    if numOccurances>0 && smallestWord == unsortedArray.min
      unsortedArray = unsortedArray - [smallestWord]
      numOccurances.times do
         unsortedArray.push(smallestWord)
       end   
    elsif numOccurances>0 && smallestWord != unsortedArray.min
      unsortedArray = unsortedArray - [smallestWord.capitalize]
      numOccurances.times do
         unsortedArray.push(smallestWord.capitalize)
       end  
    else
      unsortedArray = unsortedArray - [smallestWord]
    end
    sortedArray = sortedArray.push(smallestWord)
    recursiveSortMethod(unsortedArray, sortedArray)
  end
end

puts 'my sort method'
puts sortMethod(inputArray)
puts
puts 'ruby\'s sort method'
puts inputArray.sort
  