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
end