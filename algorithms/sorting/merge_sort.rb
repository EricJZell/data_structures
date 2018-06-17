require 'pry'
# merge sort is O(n log(n)) ALWAYS. It take more memory than quicksort but quicksort may be O(n^2) if already sorted
# Here, I do not bother doing merger sort in place, making its space complexity even worse than O(n)
array = []
n = 5000
n.times { array.push(rand(100)) }
@ops = 0
def merge_sort(array)
  return array if array.length <= 1
  mid = array.length / 2 # ruby int division rounds down, so this is correct left
  left = merge_sort(array[0..mid - 1])
  right = merge_sort(array[mid..-1])
  merge(left, right)
end

def merge(left, right)
  sorted = []
  while left.any? && right.any?
    @ops += 1
    if left.first < right.first
      sorted.push(left.shift)
    else
      sorted.push(right.shift)
    end
  end
  @ops += left.size + right.size
  sorted + left + right #one of left or right will be empty, but thats ok
end
merge_sort(array).to_s
puts "Operations = #{@ops}"
puts "n * log2(n) = #{Math.log2(n) * n}"
