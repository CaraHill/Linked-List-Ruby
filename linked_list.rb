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

    if @node && @node.next
      new_node.previous = @node.next
      new_node.previous.next = new_node
    end

    new_node.previous = @node unless @node.nil? || @node.next
    @node.next = new_node unless @node.nil? || @node.next

    @node = new_node
  end

  def pop
    return @node if @node.nil?

    if @node.next
      element = @node.next
      @node.next = nil if @node
      return element.datum
    end

    element = @node
    @node = element.previous
    @node.next = nil if @node
    element.datum
  end

  def shift
    return @node if @node.nil?

    unless @node.previous
      element = @node
      @node = element.next
      @node.previous = nil if @node
      return element.datum
    end

    unless @node.previous.previous
      element = @node.previous
      @node.previous = nil
      return element.datum
    end

    if @node.previous.previous
      element = @node.previous.previous
      @node.previous.previous = nil
      return element.datum
    end

    element = @node
    @node = nil
    element.datum
  end

  def unshift(number)
    new_node = Node.new(number)

    new_node.next = @node unless @node.nil?
    @node.previous = new_node unless @node.nil?

    @node = new_node
  end
end
