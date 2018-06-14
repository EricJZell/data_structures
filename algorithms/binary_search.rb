def binary_search(collection, element)
  start_index = 0
  end_index = collection.length - 1
  while start_index <= end_index
    middle_index = (start_index + end_index) / 2
    middle_element = collection[middle_index]
    if element == middle_element
      return "Found Element at index #{middle_index}"
    elsif element > middle_element
      start_index = middle_index + 1
    else
      end_index = middle_index - 1
    end
  end
  "Element Not Found"
end
