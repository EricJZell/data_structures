to_sort = []
30.times do
  to_sort << (rand(26) + 97).chr
end

puts "To be sorted: " + to_sort.join(', ')

def bubble_sort(array)
  sorted = false
  while !sorted
    sorted = true
    for i in (0..array.size-2) do
      if array[i] > array[i + 1]
        sorted = false
        tmp = array[i]
        array[i] = array[i + 1]
        array[i + 1] = tmp
      end
    end
  end
  array
end

puts "Sorted: " + bubble_sort(to_sort).join(', ')
