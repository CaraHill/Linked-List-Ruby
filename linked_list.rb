# frozen_string_literal: true

# The Node class
class Node
  attr_reader   :datum
  attr_accessor :next, :previous

  def initialize(datum)
    @datum = datum
    @next = nil
    @previous = nil
  end
end

# The Deque class
class Deque
  def initialize
    @head = nil
    @tail = nil
  end

  def push(number)
    new_node = Node.new(number)
    new_node.previous = @tail
    @tail.next = new_node if @tail

    @tail = new_node
    @head = new_node if @head.nil?
  end

  def pop
    element = @tail

    nilify_tail_and_head if @tail == @head

    update_tail unless @tail == @head

    element.datum
  end

  def shift
    element = @head

    nilify_tail_and_head if @tail == @head

    update_head unless @tail == @head

    element.datum
  end

  def unshift(number)
    new_node = Node.new(number)
    new_node.next = @head
    @head.previous = new_node if @head

    @head = new_node
    @tail = new_node if @tail.nil?
  end

  private

  def nilify_tail_and_head
    @head = nil
    @tail = nil
  end

  def update_tail
    @tail = @tail.previous
    @tail.next = nil
  end

  def update_head
    @head = @head.next
    @head.previous = nil
  end
end
