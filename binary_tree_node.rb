require 'pry'
require_relative 'queue'
require_relative 'stack'

class Node
  attr_accessor :value, :left_child, :right_child
  def initialize(value)
    @value = value
    @left_child = nil
    @right_child = nil
  end

  def insert(new_value)
    if left_child.nil?
      @left_child = Node.new(new_value)
    elsif right_child.nil?
      @right_child = Node.new(new_value)
    else
      # insert randomly in the left or right tree
      [true, false].sample ? @left_child.insert(new_value) : @right_child.insert(new_value)
    end
  end
end

class Iterator
  attr_accessor :queue
  def initialize(node)
    @queue = Queue.new
    inorder_traversal(node) { |node| @queue.add(node) }
  end

  def next
    node = @queue.remove
    node.value
  end
end

def inorder_traversal(node, &block)
  if node
    inorder_traversal(node.left_child, &block)
    yield node
    inorder_traversal(node.right_child, &block)
  end
end

def preorder_traversal(node, &block)
  if node
    yield node
    preorder_traversal(node.left_child)
    preorder_traversal(node.right_child)
  end
end

def postorder_traversal(node, &block)
  if node
    postorder_traversal(node.left_child)
    postorder_traversal(node.right_child)
    yield node
  end
end

def depth_first_search(node, &block)
  if node
    yield node
    depth_first_search(node.left_child)
    depth_first_search(node.right_child)
  end
end

def depth_first_iterative(node, &block)
  stack = Stack.new.push(node)
  while !stack.is_empty?
    node = stack.pop
    yield node
    stack.push(node.right_child) if node.right_child
    stack.push(node.left_child) if node.left_child
  end
end

def breadth_first_search(node, &block)
  queue = Queue.new.add(node)
  while !queue.is_empty?
    node = queue.remove
    yield node
    queue.add(node.left_child) if node.left_child
    queue.add(node.right_child) if node.right_child
  end
end

def copy(node)
  if node
    new_node = Node.new(node.value)
    new_node.left_child = copy(node.left_child)
    new_node.right_child = copy(node.right_child)
    return new_node
  end
end

root = Node.new(0)
(1..20).each{ |i| root.insert(i) }
binding.pry
puts "exiting"
