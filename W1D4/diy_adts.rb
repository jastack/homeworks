#Exercise 1 - Stack
class Stack
  attr_reader :store

  def initialize
    @store = []
  end

  def add(el)
    store << el
  end

  def remove
    store.pop
  end

  def show
    store
  end

end

#Exercise 2 - Queue
class Queue
  attr_reader :store

  def initialize
    @store = []
  end

  def enqueue(el)
    store << el
  end

  def dequeue
    store.shift
  end

  def show
    store
  end
end

#Exercise 3 - Map
class Map
  attr_reader :store

  def initialize
    @store = []
  end

  def assign(key, value)
    keys = store.map { |pair| pair[0] }
    if keys.include?(key)
      index = keys.index(key)
      store[index] = [key, value]
    else
      store << [key, value]
    end
  end

  def lookup(key)
    keys = store.map { |pair| pair[0] }
    index = keys.index(key)
    store[index]
  end

  def remove(key)
    keys = store.map { |pair| pair[0] }
    index = keys.index(key)
    store.delete(store[index])
  end

  def show
    store
  end

end
