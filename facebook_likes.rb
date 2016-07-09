def likes(names)
  num_names = names.length
  like_statement = "no one likes this" if num_names == 0
  like_statement = "#{names[0]} likes this" if num_names == 1
  like_statement = "#{names[0]} and #{names[1]} like this" if num_names == 2
  like_statement = "#{names[0]}, #{names[1]} and #{names[2]} like this" if num_names == 3
  like_statement = "#{names[0]}, #{names[1]}, #{names[2]} and #{num_names-3} other likes this" if num_names == 4
  like_statement = "#{names[0]}, #{names[1]}, #{names[2]} and #{num_names-3} others like this" if num_names > 4
  puts like_statement
end


likes([])
likes(['Peter'])
likes(['Jacob', 'Alex'])
likes(['Max', 'John', 'Mark'])
likes(['Alex', 'Jacob', 'Mark', 'Max'])
likes(['Alex', 'Jacob', 'Mark', 'Max', 'Jacob', 'Mark', 'Max'])
