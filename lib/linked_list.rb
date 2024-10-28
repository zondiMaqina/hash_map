class LinkedList
  attr_accessor :head
  def initialze
    @haed = nil
  end

  def append(node)
  end
end

class Node
  attr_accessor :next_node
  attr_reader :value, :key
  def initialize(value, key)
    @next_node = nil
    @value = value
    @key = key
  end
end