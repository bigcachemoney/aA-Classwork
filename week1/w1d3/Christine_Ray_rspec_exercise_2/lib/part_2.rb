require 'byebug'

def palindrome?(str)
    reverse_word = ""
    i = str.length - 1
    while i >= 0 
        reverse_word += str[i]
        i -= 1
    end
    if str == reverse_word
        return true
    end
    false
end

def substrings(str)
    #debugger
    substring_arr = []
    (0..str.length - 1).each do |idx1|
        (idx1..str.length - 1).each do |idx2|
            substring_arr << str[idx1..idx2]
        end
    end
    substring_arr
end

def palindrome_substrings(str)
    new_arr = []
    substring = substrings(str)
    substring.each do |ele|
        if ele.length > 1 and palindrome?(ele)
            new_arr << ele
        end
    end
    new_arr    
end