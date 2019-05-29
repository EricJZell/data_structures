def word_count(phrase)
  counts = {}
  phrase.scan(/\w+/) { |word| counts[word] = counts[word].to_i + 1 }
  counts
end
