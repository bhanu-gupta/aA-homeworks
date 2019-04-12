class Map

    def initialize
        @map = []
    end

    def set(key, value)
        @map.each_with_index do |pair,idx|
            if pair[0] == key
                @map[idx] = [key,value]
                return @map
            end
        end
        @map << [key, value]
    end

    def get(key)
        @map.each do |pair|
            if pair[0] == key
                return pair[1]
            end
        end
        nil
    end

    def delete(key)
        @map.each_with_index do |pair,idx|
            if pair[0] == key
                @map = @map[0...idx] + @map[idx+1..-1]
                return true
            end
        end
        false
    end

    def show
        @map
    end
end