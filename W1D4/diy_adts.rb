#Exercise 1 - Stack
class Stack
  attr_reader :store

  def initialize
    @store = []
  end

  def add(el)
    @store << el
  end

  def remove
    @store.pop
  end

  def show
    store
  end


end
