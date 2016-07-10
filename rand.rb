def get_sum(a,b)
  array = []
  if a==b
    array<<a
  elsif a>b
    (b..a).each do |i|
      array<<i
    end
  else
    (a..b).each do |i|
      array<<i
    end
  end
  sum = array.reduce(:+)
  return sum
end


p get_sum(1,1)
p get_sum(0,1)
p get_sum(0,-1)
p get_sum(1,2)
p get_sum(5,-1)
