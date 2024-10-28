require_relative 'linked_list.rb'

class HashMap < LinkedList
  attr_reader :collisions, :entries
  attr_accessor :capacity, :buckets
  
  def initialize(capacity = 15)
    @capacity = capacity
    @entries = 0
    @collisions = 0
    @buckets = Array.new(@capacity)
  end

  def hash(key) # produces a hash code from node's key
    code = 0
    prime_number = 31
    key.each_char {|char| code = (code * prime_number + char.ord) }
    code % @capacity
  end

  def set(key, value) # creates a new node and adds it to the hash map
    node_index = hash(key)
    raise IndexError if node_index.negative? || node_index >= @buckets.length
    new_node = Node.new(value, key)
    add_node(node_index, new_node, key) # adds node to hash map
  end

  def add_node(node_index, new_node, key)
    if @buckets[node_index].nil?
      @buckets[node_index] = new_node
      LinkedList.new.head = new_node # makes first node the head of linked list
      @buckets.index(new_node)
    elsif @buckets[node_index] != nil && @buckets[node_index].key != key
      current_node = @buckets[node_index]
      append(new_node, current_node)
    elsif @buckets[node_index].key == key
      @buckets[node_index].value = new_node.value
    end
  end
end

map = HashMap.new
map.set('red', 'blood')
map.set('red', 'elephant')
map.set('abc', 'alphabet')
map.set('cab', 'transportation')
map.set('bac', 'nonsense')

# fix length of `add node` method