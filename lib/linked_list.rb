# create linked list class
# class must keep track of the @head
class LinkedList
  attr_accessor :head
  def initialze
    @haed = nil
  end
end

# create node class
# each node must keep track of its value, key, next node
class Node
  attr_accessor :next_node
  attr_reader :value, :key
  def initialize(value, key)
    @next_node = nil
    @value = value
    @key = key
  end
end