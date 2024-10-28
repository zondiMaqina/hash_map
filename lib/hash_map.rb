require_relative 'linked_list.rb'

class HashMap < LinkedList
  attr_reader :entries
  attr_accessor :capacity, :buckets
  
  def initialize(capacity = 15)
    @capacity = capacity
    @entries = 0
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
    elsif @buckets[node_index] != nil && @buckets[node_index].key != key
      current_node = @buckets[node_index]
      append(new_node, current_node)
    elsif @buckets[node_index].key == key
      @buckets[node_index].value = new_node.value
    end
  end

  def get(key) # returns the value of the node with the given key
    node_index = hash(key)
    bucket = @buckets[node_index]
    if bucket == nil
      nil
    elsif bucket.key == key
      bucket.next_node = nil
      bucket
    elsif bucket.key != key
      get_node(bucket, key)
    end
  end

  def resize
    buckets_copy = []
    @buckets.each {|bucket| buckets_copy << bucket if bucket != nil}
    @buckets.clear
    @capacity *= 2
    @buckets = Array.new(@capacity)
    buckets_copy.each {|bucket| @buckets[hash(bucket.key)] = bucket}
  end
end


map = HashMap.new
map.set('red', 'blood')
map.set('red', 'elephant')
map.set('abc', 'alphabet')
map.set('cab', 'transportation')
map.set('bac', 'nonsense')
map.buckets
p map.get('red')
# add the resize method
# method should spread the nodes to their appropiate indexes

# doubles up the current size of array
# iterates throught buckets
# takes real value stores it in variables
# deletes that value and stores it in a new index