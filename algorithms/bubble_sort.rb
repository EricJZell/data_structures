require 'pry'
# bubble sort is a O(n^2) sort algorithm. Its best case CAN be O(n))
# It can me executed completely in place for space complexity of O(1)
array = []
n = 50
n.times { array.push(rand(50)) }


def bubble_sort(array)
  sorted = false
  while !sorted
    sorted = true
    for i in (0..array.length - 2)
      if array[i] > array[i + 1]
        sorted = false
        tmp = array[i]
        array[i] = array[i + 1]
        array[i + 1] = tmp
      end
    end
  end
end

bubble_sort(array)
puts array.to_s
