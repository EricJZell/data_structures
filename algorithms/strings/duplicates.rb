require 'pry'
def dups?(string)
  found = {}
  for i in (0..string.length - 1)
    if found[string[i]]
      return true
    else
      found[string[i]] = true
    end
  end
  false
end

def dups_in_place(string)
  for i in (0..string.length - 1)
    for j in (0..string.length - 1)
      next if i == j
      return true if string[i] == string[j]
    end
  end
  false
end

binding.pry
puts 'exiting'
