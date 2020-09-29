# Define your methods here.
require 'byebug'
def my_map!(arr, &block)
    arr.each_with_index do |ele, i|
        arr[i] = block.call(ele)
    end
    arr
end

def two?(arr, &block)
    arr.count(&block) == 2
end

def nor_select(arr, p1, p2)
    arr.select{|ele| !p1.call(ele) & !p2.call(ele)}
end

def array_of_hash_sum(arr)
    new_arr = []
    arr.each do |hash|
        hash.each do |key, value|
            new_arr << value
        end
    end
    new_arr.sum
end

def slangify(sentence)
    #debugger
    words = sentence.split(" ")
    new_words = []

    words.each do |word|
        new_words << remove_vowels(word)
    end
    new_words.join(" ")
end

def remove_vowels(word)
    vowels = "aeiouAEIOU"
    new_word = ""
    (0...word.length).each do |i|
        if vowels.include?(word[i])
            return word[0...i] + word [i+1..-1]
        else
            new_word = word
        end
    end     
    new_word
end

def char_counter(str, *args)
    #debugger
    hash = Hash.new(0)
    new_hash = Hash.new
    str.each_char do |char|
        hash[char] += 1
    end

    args.each do |char|
        if hash.has_key?(char)
            new_hash[char] = hash[char]
        else
            new_hash[char] = 0
        end
    end
    if args.length == 0
        return hash
    else
        new_hash
    end
    

end