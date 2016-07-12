def weirdcase string
  (string.split(" ").map {|x| (x.upcase.chars.to_a.each_with_index.map {|x, index| index%2==1 ? x.downcase : x}).join}).join(" ")
end


p weirdcase('julie ann harrow IS a GIRL')
p weirdcase('poeee')
