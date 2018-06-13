# A stack is a Last in, first out data structure
class Stack
  attr_accessor :items, :limit
  def initialize(limit=100)
    @items = []
    @limit = limit
  end

  def pop
    raise "Stack empty" if is_empty?
    items.pop
  end

  def push(value)
    if items.size < limit
      items.push(value)
    else
      raise "Stack overflow"
    end
  end

  def peek
    raise "Stack empty" if is_empty?
    puts items.last
  end

  def is_empty?
    items.empty?
  end
end
