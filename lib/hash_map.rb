require_relative 'linked_list.rb'
class HashMap
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

  def set(key, value)
    node_index = hash(key)
    raise IndexError if node_index.negative? || node_index >= @buckets.length
    new_node = Node.new(value, key)
  end
end

map = HashMap.new
# initialize a set method
# takes in a key-value pair
# hashes the key from pair to return index for buckets list
# if hashed key points to an empty index, put node there
# if hashed key points to a filled index, append that node there