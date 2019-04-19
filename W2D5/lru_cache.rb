class LRUCache
    def initialize(cache_size)
        @lru = []
        @cache_size = cache_size
    end

    def count
      # returns number of elements currently in cache
      lru.length
    end

    def add(el)
      # adds element to cache according to LRU principle
      new_arr = []
      (0...lru.length).reverse_each do |idx|
        new_arr.unshift(lru[idx]) unless lru[idx] == el
        if new_arr.length == cache_size - 1
            break
        end
      end
      new_arr.push(el)
      self.lru = new_arr
    end

    def show
      # shows the items in the cache, with the LRU item first
      p lru
    end

    private
    # helper methods go here!
    attr_reader :lru, :cache_size
    attr_writer :lru

  end

    johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})

  johnny_cache.show