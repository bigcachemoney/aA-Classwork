require 'byebug'

def partition(arr, num)
    new_arr = [[], []]
    (0..arr.length - 1).each do |i|
        if arr[i] < num
            new_arr[0] << arr[i]
        else
            new_arr[1] << arr[i]
        end
    end
    new_arr
end

def merge(hash1, hash2)
    #hash1.merge(hash2)
    new_hash = {}
    hash1.each do |k, v|
        if !new_hash[k]
            new_hash[k] = hash1[k]
        end
    end
    hash2.each do |k, v|
        if !new_hash[k]
            new_hash[k] = hash2[k]
        elsif new_hash[k]
            new_hash[k] = hash2[k]
        end
    end
    new_hash
end

def censor(sentence, curse_words)
    new_sentence = sentence.split(" ") 
    vowels = "aeiouAEIOU"
    censored = []

    new_sentence.each do |word|
        if curse_words.include?(word.downcase)
            new_word = ""
            word.each_char do |char|
                if vowels.include?(char)
                    new_word += "*"
                else
                    new_word += char
                end
            end
            censored << new_word
        else 
            censored << word
        end
    end
    censored.join(" ")
end

def power_of_two?(num)
    #debugger
    (0..num).each do |exponent|
        if 2 ** exponent == num
            return true
        end 
    end
    false        
end



