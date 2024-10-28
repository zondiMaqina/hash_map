class LinkedList
  attr_accessor :head
  def initialze
    @haed = nil
  end

  def append(new_node, current_node)
    until current_node.next_node == nil
      current_node = current_node.next_node
    end
    current_node.next_node = new_node
  end
end

class Node
  attr_accessor :next_node
  attr_reader :value, :key
  def initialize(value, key)
    @key = key
    @value = value
    @next_node = nil
  end
end