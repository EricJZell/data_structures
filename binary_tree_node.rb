require 'pry'
require_relative 'queue'
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

def inorder_traversal(node)
  if node
    inorder_traversal(node.left_child, &block)
    puts node.value
    inorder_traversal(node.right_child, &block)
  end
end

def preorder_traversal(node)
  if node
    puts node.value
    preorder_traversal(node.left_child, &block)
    preorder_traversal(node.right_child, &block)
  end
end

def postorder_traversal(node)
  if node
    postorder_traversal(node.left_child, &block)
    postorder_traversal(node.right_child, &block)
    puts node.value
  end
end

def depth_first_search(node)
  if node
    puts node.value, search_item
    depth_first_search(node.left_child, search_item, &block)
    depth_first_search(node.right_child, search_item, &block)
  end
end

def breadth_first_search(node)
  queue = Queue.new(node)
  while !queue.is_empty?
    node = queue.remove
    puts node.value
    queue.add(node.left_child) if node.left_child
    queue.add(node.right_child) if node.right_child
  end
end

root = Node.new(0)
(1..20).each{ |i| root.insert(i) }
