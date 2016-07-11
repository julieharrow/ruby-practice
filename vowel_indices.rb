def vowel_indices(word)
  vowels = %w[a e i o u y]
  array_of_vowels =[]
  word.downcase.chars.to_a.each_with_index {|char, index| array_of_vowels<<index+1 if vowels.include?(char)}
  return array_of_vowels
end


p vowel_indices("")
p vowel_indices("Mmm")
p vowel_indices("Apple")
p vowel_indices("super")
