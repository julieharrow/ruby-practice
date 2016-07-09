def unique_in_order(iterable)
  if iterable == [] || iterable == ""
    unique_array = []
  else
    iterable = iterable.chars.to_a if iterable.class == String
    unique_array = []
    unique_array<<iterable[0]
    (1..iterable.length-1).each {|i| unique_array<<iterable[i] if iterable[i] != iterable[i-1]}
  end
  unique_array
end

p unique_in_order([1,3,4,4,4,4,5,6,6,6,7])
p unique_in_order("aAbBBBcCdddDe")
p unique_in_order([])
p unique_in_order("")
