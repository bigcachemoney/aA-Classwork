require 'byebug'

def zip(*arrs)
   arrs.transpose
   #arrs[row][col] = arrs[col][row] 
end 

def prizz_proc(arr, p1, p2)
    arr.select {|ele| p1.call(ele) ^ p2.call(ele) }
end 

def zany_zip(*arrs) 
    longest = 0
    new_arr = []

    i = 0
    while i < arrs.length 
        if longest < arrs[i].length 
            longest = arrs[i].length
        end
        i+=1
    end

    arrs.each do |subarr|
        i = 0
        while subarr.length < longest
            subarr << nil
            i+=1
        end
        new_arr << subarr 
    end
     
    new_arr.transpose
end


def maximum(arr, &prc)
    return nil if arr.empty? 
    
    arr.inject do |acc, ele|
        if prc.call(acc) > prc.call(ele)
            acc 
        else 
            ele  
        end 
    end 
end 

def my_group_by(arr, &prc)
    hash = Hash.new {|h,k| h[k] = []}

    arr.each do |ele|
        key = prc.call(ele)
        hash[key] << ele
    end
    hash
end 

def max_tie_breaker(arr, prc, &block)
   return nil if arr.empty? 

    arr.inject do |acc, ele|
        if block.call(acc) > block.call(ele) #run both acc + ele into the block, take the LARGER original
            acc #ACC is larger
                    elsif block.call(acc) == block.call(ele) #TIE, use prc.call to see which is bigger
                        if prc.call(acc) < prc.call(ele)
                            ele
                        else
                            acc 
                        end 
        else #block.call(acc) < block.call(ele)
            ele #ELE is larger
        end 
    end 
end 

def silly_syllables(sentence)
    #debugger
    words = sentence.split(" ")
    new_words = words.map do |word|
        if word.split("").count { |char| 'aeiou'.include?(char)} > 1
            first = word.index(/[aeiou]/) #2
            last = word.rindex(/[aeiou]/) #4
            word[first..last] #word[2..4]
        else
            word
        end
    end
    new_words.join(" ")
end




