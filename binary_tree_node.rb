require 'pry'
require_relative 'queue'
require_relative 'stack'

# class Node
#   attr_accessor :value, :left_child, :right_child
#   def initialize(value)
#     @value = value
#     @left_child = nil
#     @right_child = nil
#   end
#
#   def insert(new_value)
#     if left_child.nil?
#       @left_child = Node.new(new_value)
#     elsif right_child.nil?
#       @right_child = Node.new(new_value)
#     else
#       # insert randomly in the left or right tree
#       [true, false].sample ? @left_child.insert(new_value) : @right_child.insert(new_value)
#     end
#   end
# end
#
# class BSTNode < Node
#   def insert(new_value)
#     if new_value < @value
#       if left_child.nil?
#         @left_child = BSTNode.new(new_value)
#       else
#         @left_child.insert(new_value)
#       end
#     else
#       if right_child.nil?
#         @right_child = BSTNode.new(new_value)
#       else
#         @right_child.insert(new_value)
#       end
#     end
#   end
# end
#
# class Iterator
#   attr_accessor :queue
#   def initialize(node)
#     @queue = Queue.new
#     inorder_traversal(node) { |node| @queue.add(node) }
#   end
#
#   def next
#     node = @queue.remove
#     node.value
#   end
# end
#
#
#
# def balance_bst(node)
#   array = []
#   inorder_traversal(node){ |node| array.push(node.value) }
#   node = insert_midpoint(nil, array)
# end
#
# def inorder_traversal(node, &block)
#   if node
#     inorder_traversal(node.left_child, array)
#     yield node
#     inorder_traversal(node.right_child, array)
#   end
# end
#
# def preorder_traversal(node, &block)
#   if node
#     yield node
#     preorder_traversal(node.left_child)
#     preorder_traversal(node.right_child)
#   end
# end
#
# def postorder_traversal(node, &block)
#   if node
#     postorder_traversal(node.left_child)
#     postorder_traversal(node.right_child)
#     yield node
#   end
# end
#
# def depth_first_search(node, &block)
#   if node
#     yield node
#     depth_first_search(node.left_child)
#     depth_first_search(node.right_child)
#   end
# end
#
# def depth_first_iterative(node, &block)
#   stack = Stack.new.push(node)
#   while !stack.is_empty?
#     node = stack.pop
#     yield node
#     stack.push(node.right_child) if node.right_child
#     stack.push(node.left_child) if node.left_child
#   end
# end
#
# def breadth_first_search(node, &block)
#   queue = Queue.new.add(node)
#   while !queue.is_empty?
#     node = queue.remove
#     yield node
#     queue.add(node.left_child) if node.left_child
#     queue.add(node.right_child) if node.right_child
#   end
# end
#

class Node
  attr_accessor :value, :left, :right
  def initialize(value)
    @value = value
    @left, @right = nil, nil
  end
  def insert(new_value)
    if left.nil?
      self.left = Node.new(new_value)
    elsif right.nil?
      self.right = Node.new(new_value)
    else
      [true, false].sample ? left.insert(new_value) : right.insert(new_value)
    end
  end
end

class BSTNode < Node
  def insert(new_value)
    if new_value < value
      if left.nil?
        self.left = BSTNode.new(new_value)
      else
        left.insert(new_value)
      end
    else
      if right.nil?
        self.right = BSTNode.new(new_value)
      else
        right.insert(new_value)
      end
    end
  end
end

def bfs(node, &block)
  q = Queue.new
  q.add(node)
  while !q.is_empty?
    node = q.remove
    yield(node)
    q.add(node.left) if node.left
    q.add(node.right) if node.right
  end
end

# This is the same as a pre order traversal
def dfs(node, &block)
  yield node
  dfs(node.left, &block) if node.left
  dfs(node.right, &block) if node.right
end

def inorder(node, &block)
  inorder(node.left, &block) if node.left
  yield node
  inorder(node.right, &block) if node.right
end

def postorder(node, &block)
  postorder(node.left, &block) if node.left
  postorder(node.right, &block) if node.right
  yield node
end

def dfs_iter(node, &block)
  stack = Stack.new
  stack.push(node)
  while !stack.is_empty?
    node = stack.pop
    yield node
    stack.push(node.right) if node.right
    stack.push(node.left) if node.left
  end
end

def sorted_array_to_bst(array)
  return if array.length <= 0
  mid = (array.length) / 2
  node = BSTNode.new(array[mid])
  node.left = sorted_array_to_bst(array[0..mid - 1]) if mid > 0
  node.right = sorted_array_to_bst(array[mid + 1..-1]) if mid < array.length
  node
end

def balance_bst(node)
  array = []
  inorder(node){ |node| array.push(node.value) }
  node = sorted_array_to_bst(array)
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
(1..10).each{ |i| root.insert(i) }
binding.pry
puts "exiting"
