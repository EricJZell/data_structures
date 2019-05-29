def hamming(string1, string2)
  raise ArgumentError if string1.length != string2.length
  distance = 0
  for i in (0..string1.length)
    distance += 1 if string1[i] != string2[i]
  end
  distance
end
