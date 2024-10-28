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

  def get_node(node, raw_key)
    node_needed = nil
    current_node = node #current bucket containing the head node
    until current_node.next_node == nil
      current_node = current_node.next_node
      node_needed = current_node if current_node.key == raw_key
    end
    if node_needed == nil
      nil
    else
      node_needed.next_node = nil
      node_needed
    end
  end
end

class Node
  attr_accessor :next_node, :value
  attr_reader :key
  def initialize(value, key)
    @key = key
    @value = value
    @next_node = nil
  end
end