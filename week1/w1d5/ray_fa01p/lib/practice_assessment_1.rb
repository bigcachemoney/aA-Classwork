# Define your methods here. 
require 'byebug'
def first_letter_vowel_count(sentence)
    vowels = "aeiouAEIOU"
    count = 0
    words = sentence.split(" ")
    words.each_with_index do |word, i|
        count += 1 if vowels.include?(word[0])
    end
    count
end

def count_true(arr, proc)
    arr.count {|ele| proc.call(ele)}
end

def procformation(arr, p1, p2, p3)
    arr.map do |ele|
        if p1.call(ele)
            ele = p2.call(ele)
        else
            ele = p3.call(ele)
        end
    end
end

def array_of_array_sum(arr)
    arr.flatten.sum
end

def selective_reverse(sentence)
    vowels = "aeiouAEIOU"
    words = sentence.split(" ")
    new_sentence = []
    words.each do |word|
        if vowels.include?(word[0]) or vowels.include?(word[-1])
            new_sentence << word
        else
            new_sentence << word.reverse
        end
    end
    new_sentence.join(" ")
end

def hash_missing_keys(hash, *args)
    return [] if args.length == 0
    array = []
    args.each do |arg|
        if !hash.has_key?(arg)
            array << arg
        end
    end
    array
end