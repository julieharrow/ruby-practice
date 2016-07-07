inputArray = ['Ralph','julie','Stella','haprio','haprio','stella','Haprio','Julie','ralph']

def sortMethod array
  recursiveSortMethod(array, [])
end

def recursiveSortMethod unsortedArray, sortedArray
  if unsortedArray == []
    return sortedArray
  else
    lowercaseArray = unsortedArray.map!(&:downcase)
    smallestLowercaseWord = lowercaseArray.min
    numOccurances = lowercaseArray.count(smallestLowercaseWord) - 1
    if numOccurances>0 && smallestLowercaseWord == unsortedArray.min
      unsortedArray = unsortedArray - [smallestLowercaseWord]
      numOccurances.times do
         unsortedArray.push(smallestLowercaseWord)
       end   
    else
      unsortedArray = unsortedArray - [smallestLowercaseWord]
    end
    sortedArray = sortedArray.push(smallestLowercaseWord)
    recursiveSortMethod(unsortedArray, sortedArray)
  end
end

puts 'my sort method'
puts sortMethod(inputArray)
puts
puts 'ruby\'s sort method'
puts inputArray.sort
  