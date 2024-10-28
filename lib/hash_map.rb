# initialize hash map class
# class must keep track of: entries, buckets, collisions, capacity
# capaciaty is the number of buckets
class HashMap
  attr_reader :collisions, :entries
  attr_accessor :capacity, :buckets
  def initialize(capacity = 15)
    @capacity = capacity
    @entries = 0
    @collisions = 0
    @buckets = Array.new(@capacity)
  end
end