require 'benchmark'

to_sort = []
10000.times do
  to_sort << rand(10000)
end

def insertion_sort(to_sort)
  for index in 1..(to_sort.length - 1)
    for inner_index in 0..(index - 1)
      if to_sort[index] <= to_sort[inner_index]
        to_sort.insert(inner_index, to_sort[index])
        to_sort.delete_at(index + 1)
      end
    end
  end
  to_sort
end

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


def bubble_sort(to_sort)
  swapped = 1

  while swapped > 0
    swapped = 0
    to_sort.each_with_index do |letter, index|
      break if index + 1 == to_sort.length
      next_letter = to_sort[index + 1]
      if next_letter < letter
        swapped += 1
        to_sort[index] = next_letter
        to_sort[index + 1] = letter
      end
    end
  end
  to_sort
end

Benchmark.bm(15) do |r|
  # puts to_sort.join(', ')
  r.report("Selection Sort") { selection_sort(Array.new(to_sort)) }
  # puts to_sort.join(', ')
  r.report("Insertion Sort") { insertion_sort(Array.new(to_sort)) }
  # puts to_sort.join(', ')
  r.report("Bubble Sort") { bubble_sort(Array.new(to_sort)) }
end
