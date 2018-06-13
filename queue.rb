# queue a First-In-First-Out (FIFO) data structure
class Queue
  attr_accessor :items
  def initialize()
    @items = []
  end

  def add(item)
    items.push(item)
  end

  def remove
    raise "Queue Empty" if is_empty?
    items.shift
  end

  def peek
    raise "Queue Empty" if is_empty?
    items.first
  end

  def is_empty?
    items.empty?
  end
end
