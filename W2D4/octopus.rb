def sluggish_octopus(arr)
    result = arr.first
    arr.each do |ele1|
        arr.each do |ele2|
            if ele1.length > ele2.length
                curr_max = ele1
            else
                curr_max = ele2
            end
            if result.length < curr_max.length
                result = curr_max
            end
        end
    end
    result
end

def dominant_octopus(arr)
    sorted_arr = quick_sort(arr)
    return sorted_arr.last
end

def quick_sort(arr)
    return [] if arr.length == 0
    return arr if arr.length == 1
    pivot = arr.first
    left = arr.drop(1).select {|ele| ele.length<=pivot.length}
    right = arr.drop(1).select {|ele| ele.length>pivot.length}
    quick_sort(left) + [pivot] + quick_sort(right)
end

def clever_octopus(arr)
    result = arr.first
    (0...(arr.length-1)).each do |idx|
        (arr[idx].length > arr[idx+1].length) ? curr_max = arr[idx] : curr_max = arr[idx+1]
        if result.length < curr_max.length
            result = curr_max
        end
    end
    result
end

def slow_dance(dir, tiles_array)
    tiles_array.each_with_index do |ele,idx|
        if dir == ele
            return idx
        end
    end
    nil
end

def fast_dance(dir, hash)
    hash[dir]
end