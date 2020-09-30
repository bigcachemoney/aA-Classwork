class Array

    def my_each(&block)
        i = 0
        while i < self.length
            block.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&block)
        new_arr = []
        self.my_each {|ele| new_arr << ele if block.call(ele)}
        new_arr
    end

    def my_reject(&block)
        new_arr = []
        self.my_each {|ele| new_arr << ele if !block.call(ele)}
        new_arr
    end

    def my_any?(&block)
        self.my_each {|ele| return true if block.call(ele)}
        false
    end

    def my_all?(&block)
    self.my_each {|ele| return false if !block.call(ele)}
    true
    end

    def my_flatten
        new_arr = []
        return new_arr if self.empty?
        # return [self[0]] if self[0].class != Array
        new_arr += self[0].class == Array ? self[0].my_flatten : [self[0]]
        new_arr += self[1..-1].my_flatten
        
        new_arr
    end

    def my_zip(*arrs)
        new_arr = Array.new(self.length) {[]}

        (0...self.length).each do |i|
            new_arr[i] << self[i]
            (0...arrs.length).each { |j| new_arr[i] << arrs[j][i] }
        end
        new_arr
    end

    def my_rotate(n = 1)
        return self if self.empty?
        n = n % self.length
        self[n..-1] + self[0...n]
    end

    def my_join(string="")
        new_str = ""
        (0...self.length-1).each {|ele| new_str += self[ele] + string}
        return new_str += self[-1].to_s
    end

    def my_reverse
        new_arr = []
        (0...self.length).each {|i| new_arr << self[self.length - 1 - i]}
        new_arr
    end

    def bubble_sort!(&prc)
        sorted = false
        prc ||= Proc.new() {|a, b| a <=> b} 

        while !sorted
            sorted = true
            (0...self.length - 1).each do |i|
                self[i], self[i + 1], sorted = self[i + 1], self[i], false if prc.call(self[i], self[i + 1]) == 1
            end
        end
    end

    def bubble_sort(&prc)
        new_arr = self.dup
        sorted = false
        prc ||= Proc.new() {|a, b| a <=> b} 

        while !sorted
            sorted = true
            (0...new_arr.length - 1).each do |i|
                new_arr[i], new_arr[i + 1], sorted = new_arr[i + 1], new_arr[i], false if prc.call(new_arr[i], new_arr[i + 1]) == 1
            end
        end
        new_arr
    end
end


def factors(num)
    new_arr = []
    (1...num).each {|ele| new_arr << ele if num % ele == 0}
    new_arr
end



def substrings(string)
    substrings = []
    (0...string.length).each do |i|
        (i...string.length).each do |j|
            substrings << string[i..j]
        end
    end
    substrings
end

def subwords(word, dictionary)
    substrings(word).select {|word| dictionary.include?(word)}
end