require "byebug"

class MyQueue

  def initialize
    @store = []
    @max = []
  end

  def enqueue(el)
    @store << el
    el
  end

  def dequeue
    @store.shift
  end

  def peek
    @store[0]
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

end

class MyStack

  def initialize
    @store = []
    @max = []
    @min = []
  end

  def pop
    @store.pop
  end

  def push(el)
    @store << el
    @max << el if @max == [] || el > @max[-1]
    @min << el if @min == [] || el < @min[-1]
    @store
  end

  def size
    @store.length
  end

  def peek
    @store[-1]
  end

  def empty?
    @store.empty?
  end

  def max
    @max[-1]
  end

  def min
    @min[-1]
  end

end


class StackQueue
  attr_reader :store

  def initialize
    @store = MyStack.new
    @store_reverse = MyStack.new
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
    until @store.empty?
      @store_reverse.push(@store.pop)
    end

    popped = @store_reverse.pop

    until @store_reverse.empty?
      @store.push(@store_reverse.pop)
    end
    popped
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def max
    @store.max
  end

  def min
    @store.min
  end

end

def max_windowed_range(arr, window)
  max_range = nil
  debugger
  queue = StackQueue.new
  end_index = arr.length - window
  (0..end_index).each do |i|
    queue.enqueue(arr[i])
    range = nil
    if queue.size > window
      queue.dequeue
    end

    if queue.size == window
      range = queue.max - queue.min
      max_range = range if max_range == nil || range > max_range
    end

  end
  max_range
end
