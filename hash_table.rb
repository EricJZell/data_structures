# with a perfect hash function, the lookup time is O(1)
# However, with an imperfect hash function, the lookup time is O(n)
require_relative 'linked_list'

class HashTable
  attr_accessor :data
  def initialize(buckets=100)
    @buckets = buckets
    @data = Array.new(buckets)
  end

  def insert_list(words)
    words.each do |word|
      insert(word)
    end
  end

  def insert(word)
    hash_key = hash_function(word)
    if data[hash_key]
      data[hash_key].append(word)
    else
      data[hash_key] = LinkedList.new(word)
    end
  end

  def display
    data.each_with_index do |list, index|
      if list
        puts "At index #{index}:"
        list.display
      end
    end
  end

  def hash_function(word)
    word.hash % @buckets
  end

  def find(word)
    hash_key = hash_function(word)
    list = data[hash_key]
    if list
      return list.find(word)
    end
    puts "Could not find #{word}"
    return false
  end
end

ht = HashTable.new
ht.insert_list(["hello", "world", "well", "hi", "my", "name", "is", "who"])
ht.display
ht.find("hi")
ht.find("slim")
