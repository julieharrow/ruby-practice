def vowel_indices(word)
  vowels = %w[a e i o u]
  array_of_vowels = []
  word.each_with_index do |letter, index|
    if vowels.include?(letter)
      array_of_vowels<<i+1
    end
  end
  return array_of_vowels
end


vowel_indices("")
vowel_indices("Mmm")
vowel_indices("Apple")
