require 'byebug'
class Array
    def range(start, ending)
        arr = []
        (start...ending).each do |ele|
            arr << ele
        end

        arr
    end

    def range_rec(start, ending)
        return [] if start >= ending
        
        next_num = start + 1
        [start] + range_rec(next_num, ending)
    end

    #returns an array of all numbers in that range, exclusive. If end < start, you can return an empty array.
    # p range_rec(1, 5) #=> [1, 2, 3, 4]
    #Write both a recursive and iterative version of sum of an array.

    # range_rec(1, 5)
    # 1st pass: [1] + range_rec(2, 5)
    # 2nd pass:       [2] + range_rec(3, 5)
    # 3rd pass:           [3] + range_rec(4, 5)
    # 4th pass:               [4] + range_rec(5, 5)
    # 5th pass:                    [] 


    def exp1(base, num)
        #ver 1 decrementing
        return 1 if num == 0 
        return base if num == 1

        base * exp1(base, num - 1)
        #ver 2 if even, divide exponent by 2, then square the result 
    end


    def exp2(base, num)
        #ver 2 if even, divide exponent by 2, then square the result 
        return 1 if num == 0 
        return base if num == 1
        if num.even?
            exp2(base, num/2) ** 2
        else
            base * (exp2(base, (num - 1) / 2 ) ** 2)
        end
    end

    def deep_dup
        new_arr = []
# debugger
        self.each {|ele| new_arr << (ele.is_a?(Array) ? ele.deep_dup : ele)}
        new_arr
    end
end
    
    # robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# p robot_parts[1].object_id


# robot_parts_copy = robot_parts.deep_dup

# robot_parts_copy[1] << "LEDs"


# p robot_parts[1]
# p robot_parts[1].object_id


# p robot_parts_copy[1]
# p robot_parts_copy[1].object_id


    def fibonacci(n)
        return [0] if n == 1
        return [0, 1] if n == 2

        fib = [0, 1]
        while fib.length < n
            next_num = fib[-1] + fib[-2]
            fib << next_num
        end
        fib   
    end

    def fibonacci_rec(n)
        return [] if n == 0
        return [0] if n == 1
        return [0, 1] if n == 2
        #fib = []
        fib = fibonacci_rec(n - 1)
        fib << fib[-1] + fib[-2]
        fib
    end

# p fibonacci_rec(7)

def bsearch(arr, target)
    middle = arr.length / 2
    lower = arr[0...middle]
    higher = arr[middle..-1]

    return arr.index(target) if arr[middle] == target
    
    return nil if arr.empty?
    
    return nil if arr.length == 1 && !arr.include?(target)

    if target < arr[middle]
        # arr = lower
        bsearch(lower, target)
        arr.index(target)
    else
        # arr = higher
        bsearch(higher, target)
        arr.index(target)
    end   
end

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => 
#puts bsearch([], 6) # => nil