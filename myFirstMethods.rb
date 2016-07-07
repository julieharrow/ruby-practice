# method to repeatedly input my name until 
# I reach a character limit
def myMethod var
  var = var + var
  var = var * 4
end

x = 'julie '

while x.length < 100
  x = myMethod(x)
  puts x
end


# method to add a final word to my array
def myMethod var, array
  array.push(var.to_s).join('.')
end

x = ['julie ', 'is ', 'a ']
output = myMethod('harrow',x)
puts output


#recursive factorial calculation

def factorial num
  if num <0
    return 'you can\'t do this'
  end
  if num <= 1
    1
  else
    x = num * factorial(num-1)
  end
end

puts factorial(gets.to_i)