def array_addition(arr1,arr2)
  sum_array = []
  if arr1.length <= arr2.length
    (0..arr1.length-1).each do |i|
      sum_array.push(arr1[i]+arr2[i])
    end
    (arr1.length..arr2.length-1).each do |i|
      sum_array.push(arr2[i])
      end
  elsif arr1.length > arr2.length
    (0..arr2.length-1).each do |i|
      sum_array.push(arr1[i]+arr2[i])
    end
    (arr2.length..arr1.length-1).each do |i|
      sum_array.push(arr1[i])
      end
  end
  return sum_array
end

def array_addition_modified(arr1,arr2)
  sum_array = []
  if arr1.length > arr2.length
    difference = arr1.length - arr2.length
    difference.times do
      arr2<<0
    end
  elsif arr1.length < arr2.length
    difference = arr2.length - arr1.length
    difference.times do
      arr1<<0
    end
  end
  arr1.each_with_index do |num, i|
    sum_array<<(num + arr2[i])
  end
  return sum_array
end

arr1 = [1,2,3,4]
arr2 = [3,6,8,0,12,24]
puts "The sum of #{arr1} and #{arr2} is #{array_addition(arr1,arr2)}."
puts "The sum of #{arr1} and #{arr2} is #{array_addition_modified(arr1,arr2)}."
