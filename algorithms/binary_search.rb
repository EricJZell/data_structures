sorted = Array('a'..'z')
to_find = sorted[rand(26)]
puts "Sorted array: " + sorted.join(', ')
puts "To find: " + to_find
lo_index = 0
hi_index = sorted.length - 1
iterations = 0
while 1
  iterations += 1
  midpoint = ((hi_index + lo_index) / 2.0).round
  if sorted[midpoint] == to_find
    index = midpoint
    break
  else
    if to_find > sorted[midpoint]
      lo_index = midpoint + 1
    else
      hi_index = midpoint - 1
    end
  end
end
puts "Found the index of #{to_find} at #{index}"
puts Array('a'..'z')[index]

puts "Iterations: #{iterations}"
