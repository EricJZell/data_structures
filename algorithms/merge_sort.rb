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

binding.pry
puts "goodbye"
