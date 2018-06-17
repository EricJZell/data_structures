to_sort = []
30.times do
  to_sort << (rand(26) + 97).chr
end

puts "To be sorted: " + to_sort.join(', ')

def insertion_sort(to_sort)
  for index in 1..(to_sort.length - 1)
    for inner_index in 0..(index - 1)
      if to_sort[index] <= to_sort[inner_index]
        to_sort.insert(inner_index, to_sort[index])
        to_sort.delete_at(index + 1)
      end
    end
  end
  to_sort
end

puts "Sorted: " + insertion_sort(to_sort).join(', ')
