def sum_to(n)
    return nil if n < 0
    return 0 if n == 0
    n + sum_to(n-1)
end

def add_numbers(nums_array)
    return nil if nums_array.empty?
    return nums_array[0] if nums_array.length == 1
    return nums_array[0] + add_numbers(nums_array[1..-1])
end

def gamma_fnc(n)
    return nil if n < 1
    return 1 if n == 1
    (n-1) * gamma_fnc(n-1)
end

def ice_cream_shop(flavors, favorite)
    if flavors.length < 1
        return false
    elsif favorite == flavors[0]
        return true
    end
    ice_cream_shop(flavors[1..-1], favorite)
end

def reverse(string)
    return string if string.length <= 1
    return string[-1] + reverse(string[0..-2]) 
end
