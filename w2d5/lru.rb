class LRUCache
  attr_reader :size

  def initialize(size)
    @cache = []
    @size = size
  end

  def add(el)
    @cache << el unless @cache.include?(el)
    @cache.shift if @cache.count > size
    el
  end

  def show
    puts @cache
  end

end
