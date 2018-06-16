require 'pry'
# quicksort is a O(n log(n)) sort algorithm. Its worse case CAN be O(n^2)
# It can me executed more in place than merge sort, thus a better space complexity of O(log(n))
array = []
n = 1000
n.times { array.push(rand(10000)) }

@ops = 0
def quicksort(array, left=0, right=nil)
  right = array.length - 1 if right.nil?
  return if left >= right
  pivot = array[left]
  index = partition(array, left, right, pivot)
  quicksort(array, left, index - 1)
  quicksort(array, index, right)
end

def partition(array, left, right, pivot)
  while left <= right
    while array[left] < pivot
      @ops += 1
      left += 1
    end
    while array[right] > pivot
      @ops += 1
      right -= 1
    end
    if left <= right
      @ops += 1
      tmp = array[left]
      array[left] = array[right]
      array[right] = tmp
      left += 1
      right -= 1
    end
  end
  left
end

quicksort(array)
puts array.to_s
puts "ops:"
puts @ops
puts "expected"
puts Math.log2(n) * n
