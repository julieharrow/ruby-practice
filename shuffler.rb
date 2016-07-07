inputArray = ['ab','bc','cd','de','ef','fg','gh']


def shuffle inputArray
  shuffleInards(inputArray, [])
end

def shuffleInards inputArray, shuffledArray
  if inputArray == []
    return shuffledArray
  end

  'length of inputArray:'
  numObjects = inputArray.length
  'randomly chosenObject:'
  chosenObject = inputArray.fetch(rand(numObjects-1))
  'shuffledArray with added object:'
  shuffledArray.push(chosenObject)
  'inputArray removing chosen object:'
  inputArray = inputArray - [chosenObject]
  'shuffledArray:'
  shuffleInards(inputArray, shuffledArray)
  shuffledArray
end

puts 'Input Array: '
puts inputArray
puts 'Shuffled Array: '
puts shuffle(inputArray)
