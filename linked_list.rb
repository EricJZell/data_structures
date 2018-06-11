# This structure allows for efficient insertion or removal of elements from any
# position in the sequence during iteration
# Arrays have better cache locality as compared to linked lists
class Node
  attr_accessor :value, :pointer
  def initialize(value, pointer=nil)
    @value = value
    @pointer = pointer
  end
end

class LinkedList
  def initialize(value="Hello")
    @head = Node.new(value, nil)
    @tail = @head
  end

  def prepend(value)
    new_head = Node.new(value, @head)
    @head = new_head
  end

  def append(value)
    new_tail = Node.new(value, nil)
    @tail.pointer = new_tail
    @tail = new_tail
  end

  def delete(value)
    node = @head
    if node.value == value
      @head = @head.pointer
      return "deleted #{value}"
    end
    while node.pointer
      if node.pointer.value == value
        node.pointer = node.pointer.pointer
        @tail = node if !node.pointer
        return "deleted #{value}"
      end
      node = node.pointer
    end
    "Could find #{value}"
  end

  def find(value)
    node = @head
    while node
      if node.value == value
        puts "Found #{value}"
        return true
      end
      node = node.pointer
    end
    puts "#{value} not found"
    return false
  end

  def display
    current_node = @head
    while current_node.pointer
      puts current_node.value
      current_node = current_node.pointer
    end
    puts current_node.value
  end
end

# list = LinkedList.new("hello")
# list.prepend("well,")
# list.append("world")
# list.prepend("OK")
# list.append("!!!")
# list.display
# puts list.delete("well,")
# list.display
# puts list.delete("yo mama in here")
# puts list.delete("!!!")
# list.display
# list.append("Now")
# list.prepend("Again")
# list.display
# list.find("Again")
# list.find("NOOOO")
