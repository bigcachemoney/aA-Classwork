# Write a method, peak_finder(arr), that accepts an array of numbers as an arg.
# The method should return an array containing all of "peaks" of the array.
# An element is considered a "peak" if it is greater than both it's left and right neighbor.
# The first or last element of the array is considered a "peak" if it is greater than it's one neighbor.

def peak_finder(arr)
    new_arr = []

    arr.each_with_index do |num, i|
        if arr[i] == arr[0] && arr[i] > arr[i+1]        #if we're looking at the FIRST number, is it bigger than the number next to it?
            new_arr << arr[i]
        elsif arr[i] == arr[-1] && arr[i] > arr[-2]     #if we're looking at the LAST number, is it bigger than the number next to it?
            new_arr << arr[i]
        elsif arr[i-1] < arr[i] && arr[i] > arr[i+1]    #if not the first/last, compare it to the numbers left and right of it
            new_arr << arr[i]
        end
    end

    new_arr
end

p peak_finder([1, 3, 5, 4])         # => [5]
p peak_finder([4, 2, 3, 6, 10])     # => [4, 10]
p peak_finder([4, 2, 11, 6, 10])    # => [4, 11, 10]
p peak_finder([1, 3])               # => [3]
p peak_finder([3, 1])               # => [3]
