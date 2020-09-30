# def first_anagram?(str1, str2)
#     str1.chars.sort.join == str2.chars.sort.join
# end
require 'byebug'

#n!
def first_anagram?(str1, str2)
    anagrams = str1.split("").permutation(str1.length).to_a #permutation = n!
    anagrams.include?(str2.split("")) #n
end


# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

#n^2 + 0(n)

def second_anagram?(str1, str2)
    arr1 = str1.split("")
    arr2 = str2.split("")

    arr1.each do |char|
        index = arr2.index(char)
        if !str2.include?(char)
            return false 
        else 
            # debugger
            arr2.delete_at(index)
        end
    end
    arr2.empty?
end

p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> second