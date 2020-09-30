require 'byebug'
# Remove dups
# Array has a uniq method that removes duplicates from an array. It returns the unique elements in the order in which they first appeared:

# [1, 2, 1, 3, 3].uniq # => [1, 2, 3]
# Write your own version of this method called my_uniq; it should take in an Array and return a new array.

def remove_dups(array)
    new_arr = []
    array.each do |ele|
        new_arr << ele if !new_arr.include?(ele)
    end
    new_arr

end

#p remove_dups([1, 2, 1, 3, 3]).uniq # => [1, 2, 3]


# Two sum
# Write a new Array#two_sum method that finds all pairs of positions where the elements at those positions sum to zero.

# NB: ordering matters. We want each of the pairs to be sorted smaller index before bigger index. We want the array of pairs to be sorted "dictionary-wise":

# [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]
# [0, 2] before [2, 1] (smaller first elements come first)
# [0, 1] before [0, 2] (then smaller second elements come first)

def two_sum(array)
    pairs = []
    array.each_with_index do |ele1, idx1|
        array.each_with_index do |ele2, idx2|
            if idx2 < idx1 && (ele1 + ele2) == 0 
                pairs << [idx2, idx1]
            end
        end
    end
    pairs
end

def my_transpose(array)
    array.transpose
end

# Stock Picker
# Write a method that takes an array of stock prices (prices on days 0, 1, ...), and outputs the most profitable pair of days on which to first buy the stock and then sell the stock. Remember, you can't sell stock before you buy it!


def stock_picker(array)
    pairs = []
    highest = 0
    #highest_idx = 0
    array.each_with_index do |ele1, idx1|
        array.each_with_index do |ele2, idx2|
            if idx2 < idx1 && (ele1 - ele2) > highest 
                pairs << [idx2, idx1]
                highest = (ele1 - ele2)
            end
        end
    end
    pairs.pop
end

class Tower
    attr_accessor :pile1, :pile2, :pile3, :board
    def initialize
        @board = [[1,2,3],[],[]]
        # setup_board
    end

    def from
        p "please pick a pile to move the top disc from: ____, e.g. pile1, pile2, or pile3"
        from = gets.chomp
    end

    def start
        p self.board
        
        p "please pick a pile to move the top disc from: ____, e.g. 1, 2, or 3"

        from = gets.chomp
        p "please pick a pile to move the top disc to: ____, e.g. 1, 2, 3"
        
        to = gets.chomp
        move(from, to)
    end

    def move(from, to)

        if from == to
            raise "you can't move the a disc to the same pile"

        elsif from == "1" && to == "2" #move from pile1 to pile2
            board[1].unshift(board[0].shift) 
        elsif from == "1" && to == "3" #move from pile1 to pile3
            board[2].unshift(board[0].shift)

        elsif from == "2" && to == "3" #move from pile2 to pile3
            board[2].unshift(board[1].shift)
        elsif from == "2" && to == "1" #move from pile2 to pile1
            board[0].unshift(board[1].shift)

        elsif from == "3" && to == "1" #move from pile3 to pile1
            board[0].unshift(board[2].shift)
        elsif from == "3" && to == "2" #move from pile3 to pile2
            board[1].unshift(board[2].shift)
            
        end

        if !won?
            self.start
        else
            p "congrats!"
            p self.board
        end
        #shift to remove top disc
        #unshift to put disc on top of a different pile
    end

    def won?
        if @board.any? {|pile| pile == [1,2,3] && pile != board[0]}
            return true
        else
            return false
        end
    end
end

