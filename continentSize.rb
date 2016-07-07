M = 'land'
o = 'water'

world = [[o,o,o,o,o,o,o,o,o,o,o],
         [o,o,o,o,o,o,o,o,o,o,o],
         [o,o,M,o,o,o,o,o,o,o,o],
         [o,M,M,o,o,o,o,o,M,o,o],
         [o,M,M,o,o,o,M,M,M,M,M],
         [o,o,M,o,o,M,M,M,o,M,M],
         [o,o,o,o,o,o,o,o,o,M,M],
         [o,o,o,o,o,o,o,o,o,M,M],
         [o,o,o,M,o,o,o,o,M,o,o],
         [o,o,o,o,M,M,o,o,M,o,o],
         [o,o,o,o,o,M,o,o,o,o,o]]

def continentSize world, x, y
  if world[y][x] != 'land'
    return 0
  end
  
  size = 1
  world[y][x] = 'counted land'
  
  size = size + continentSize(world, x+1, y-1)
  size = size + continentSize(world, x+1, y)
  size = size + continentSize(world, x+1, y+1)
  size = size + continentSize(world, x  , y+1)
  size = size + continentSize(world, x  , y-1)
  size = size + continentSize(world, x-1, y+1)
  size = size + continentSize(world, x-1, y)
  size = size + continentSize(world, x-1, y-1)
  size
end

puts 'What is your \'x\' coordinate?  '
xCoor = gets.to_i
puts 'What is your \'y\' coordinate?  '
yCoor = gets.to_i
puts 'Here is the size of your continent: ' + continentSize(world,xCoor,yCoor).to_s

