require 'pry'
def group_sum?(array, target, start_index=0)
  if start_index >= array.length
     if target == 0
       return true
     else
       return false
     end
  end
  # Can it be done with using this element? If we use this element, the target is now target - element
  return true if group_sum?(array, target - array[start_index], start_index + 1)
  # Can it be done without using this element?
  return true if group_sum?(array, target, start_index + 1)
  false
end

binding.pry
puts "exiting"
