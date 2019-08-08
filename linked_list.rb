# frozen_string_literal: true

# The Node class
class Node
  attr_reader   :datum
  attr_accessor :next
  attr_accessor :previous

  def initialize(datum)
    @datum = datum
    @next = nil
    @previous = nil
  end
end

# The Deque class
class Deque
  def initialize
    @node = nil
  end

  def push(number)
    new_node = Node.new(number)

    new_node.previous = @node unless @node.nil?
    @node.next = new_node unless @node.nil?

    @node = new_node
  end

  def pop
    return @node if @node.nil?

    element = @node
    @node = element.previous
    element.previous = nil
    element.datum
  end

  def shift
    return @node if @node.nil?
    return @node.datum if @node.previous.nil?

    element = @node
    @node = element.next
    element.next = nil
    element.datum
  end

  def unshift(number)
    new_node = Node.new(number)

    new_node.next = @node unless @node.nil?
    @node.previous = new_node unless @node.nil?

    @node = new_node
  end
end
