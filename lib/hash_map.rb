require_relative 'linked_list.rb'

class HashMap < LinkedList
  attr_reader :entries, :product
  attr_accessor :capacity, :buckets
  
  def initialize(capacity = 15)
    @capacity = capacity
    @entries = 0
    @buckets = Array.new(@capacity)
    @LOAD_FACTOR = 0.75
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
    @entries += 1
    new_node = Node.new(value, key)
    add_node(node_index, new_node, key) # adds node to hash map
    resize if product <= @entries
  end

  def add_node(node_index, new_node, key)
    bucket = @buckets[node_index] # reference to index
    if bucket.nil?
      @buckets[node_index] = new_node
      LinkedList.new.head = new_node # makes first node the head of linked list
    elsif bucket != nil && bucket.key != key
      current_node = bucket
      append(new_node, current_node)
    elsif bucket.key == key
      bucket.value = new_node.value
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

  def product
    @LOAD_FACTOR * @capacity
  end
end

test = HashMap.new
test.set('apple', 'red')
 test.set('banana', 'yellow')
 test.set('carrot', 'orange')
 test.set('dog', 'brown')
 test.set('elephant', 'gray')
 test.set('frog', 'green')
 test.set('grape', 'purple')
 test.set('hat', 'black')
 test.set('ice cream', 'white')
 test.set('jacket', 'blue')
 test.set('kite', 'pink')
 test.set('lion', 'golden')
p test.buckets.size
# add the resize method
# method should spread the nodes to their appropiate indexes

# doubles up the current size of array
# iterates throught buckets
# takes real value stores it in variables
# deletes that value and stores it in a new index