to_sort = []
30.times do
  to_sort << (rand(26) + 97).chr
end

puts "To be sorted: " + to_sort.join(', ')

def selection_sort(to_sort)
  for index in (0..to_sort.length - 2)
    smallest = index
    for comparator in (index + 1)..(to_sort.length - 1)
      if to_sort[comparator] < to_sort[smallest]
        smallest = comparator
      end
    end
    if smallest != index
      to_sort[index], to_sort[smallest] = to_sort[smallest], to_sort[index]
    end
  end
  to_sort
end

puts "Sorted: " + selection_sort(to_sort).join(', ')
