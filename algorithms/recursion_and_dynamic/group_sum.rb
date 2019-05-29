require 'pry'
# can items in an array add to a target value?
def group_sum?(array, target, start_index=0)
  return true if target.zero?
  return false if start_index >= array.length
  # Can it be done with using this element? Or without?
  group_sum?(array, target - array[start_index], start_index + 1) || group_sum?(array, target, start_index + 1)
end

binding.pry
puts "exiting"
