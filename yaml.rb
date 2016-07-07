require 'yaml'

test_array = ['give quiche a chance','Mutants Out!', 'Chameleonic life-Forms, no thanks!']

test_string = test_array.to_yaml

filename = 'rimmerTshirts.txt'

File.open filename, 'w' do |f|
  f.write test_string
end

read_string = File.read filename
read_array = YAML::load read_string
puts(read_string == test_string)
puts(read_array == test_array)

puts rimmerTshirts.txt

#example 2 ---------------------------------------


