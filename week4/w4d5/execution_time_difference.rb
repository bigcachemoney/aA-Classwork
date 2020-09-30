require "byebug"
#n^2 quadratic
#nesting two loops. If our array has n items, our outer loop runs n times and our inner loop runs n times for each iteration of the outer loop, giving us n^2 (or "quadratic time").
#constant * n^2 = n^2
def my_min(list)
    min = list[0]

    list.each_with_index do |ele1, idx1|    #n times
        list.each_with_index do |ele2, idx2| #n times
            min = ele2 if min > ele2 && idx2 > idx1 #constant operation 
        end    
    end
    min
end

#n? -ray
# -tony 
# O(n^2).

# And the reason for that is that with each we are going over all the characters in the string word. That alone would be a linear time algorithm O(n), but inside the block we have the count method.
# This method is effectively another loop which goes over all the characters in the string again to count them.
#https://www.rubyguides.com/2018/03/time-complexity-for-ruby-developers/

def my_min_b(list)
    min = list.first
    list.each {|ele| min = ele if min > ele}
    min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_b(list)

#n^3 -tony (cubic)
#n^3 + n^3 = n^3
#Same as n^2, but time grows in a n^3 relation to input size. Look for a triple nested loop to recognize this one.
def largest_contiguous_subsum(array)
    combinations = [] #n^2 input size
    (0...array.length - 1).each do |idx1|
        (idx1...array.length).each do |idx2|    
            combinations << array[idx1..idx2]  # O(n) slicing an array requires iteration, creates n^2 amount of subarrays
        end
    end
    max = array.first 
    combinations.each do |combo| #O(n^2) because of input size
        max = combo.sum if combo.sum > max #summing =  O(n)
    end
    max
end

#n?????   O(n), O(1)
def largest_contiguous_subsum2(array)
    max = array.first 
    current = array.first

    i = 1
    while i < array.length
        # current = 0 if current < 0
        current += array[i]
        max = current if current > max
        i += 1
    end                   
    max
end         

 list = [2, 3, -6, 7, -6, 7]  
 p largest_contiguous_subsum2(list) # => 8 (from [7, -6, 7])
 
#  list = [-5, -1, -3]
# p largest_contiguous_subsum2(list) # => -1 (from [-1])