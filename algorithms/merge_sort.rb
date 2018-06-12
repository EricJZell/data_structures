require 'pry'

def merge_sort(array)
  return array if array.count <= 1
  i = (array.length - 1) / 2
  left = merge_sort(array[0..i])
  right = merge_sort(array[i + 1..-1])
  return merge(left, right)
end

def merge(left, right)
  array = []
  while left.any? && right.any?
    if left.first < right.first
      array.push(left.shift)
    else
      array.push(right.shift)
    end
  end
  array + left + right
end

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

binding.pry
puts "goodbye"
