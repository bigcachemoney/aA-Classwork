#The Board class is responsible for adding a player's marks, checking for winners, and printing the game board. A board instance must have an attribute to represent the grid. For simplicity, give the grid the dimensions of classic tic-tac-toe, 3x3.
require 'byebug'
class Board
# Board#initialize
# A Board instance must have an instance variable to represent the game grid. For now, Board#initialize does not need to accept any arguments. Initialize the grid so that all positions are empty; this means that every position should contain an underscore ('_').
    def initialize
        @board = Array.new(3) {Array.new(3, "_")}
    end 
# Board#valid?(position)
# This method should return a boolean indicating whether or not the specified position is valid for the board, meaning the position is not "out of bounds."
    def valid?(position) #[][]
        row, col = position
        if ((row < 4) && (col < 4)) && ((row >= 0) && (col >= 0))
            return true
        end
        false
    end
# Board#empty?(position)
# This method should return a boolean indicating whether or not the specified position does not contain a player's mark.
    def empty?(position)
        row, col = position
        return @board[row][col] == "_"
    end
# Board#place_mark(position, mark)
# This method should assign the given mark to the specified position of the grid. It should raise an error when the position is not #valid? or not #empty?.
    def place_mark(position, mark)
        row, col = position
        if self.valid?(position) && self.empty?(position)
            @board[row][col] = mark
        else
            raise "position not valid"
        end
    end 
# Board#print
# This method should simply print out the board and all of the marks that have been placed on it. Feel free to style the printing as much as you'd like, but be sure to print out each row of the board on a new line. This will help us visualize the board better as we debug or even play the game!
    def print
        @board.each do |row|
            puts row.join(" ")
        end
    end
# Board#win_row?(mark)
# This method should return a boolean indicating whether or not the given mark has completely filled up any row of the grid.
    def win_row?(mark)
        @board.any? do |row|
            row.all? {|ele| mark == ele} 
        end
    end
# Board#win_col?(mark)
# This method should return a boolean indicating whether or not the given mark has completely filled up any column of the grid.
    def win_col?(mark)
        @board.transpose.any? do |col|
            col.all? {|ele| mark == ele} 
        end
    end
# Board#win_diagonal?(mark)
# This method should return a boolean indicating whether or not the given mark has completely filled up either diagonal of the grid.
#0,0
#1,1
#2,2

#0,2š
#2,0
    def win_diagonal?(mark)
        debugger
        left_to_right = (0...@board.length).all? do |i|
            pos = i, i 
            @board[pos] == mark
        end

        right_to_left = (0...@board.length).all? do |i|
            row = i
            col = @board.length - 1 - i
            pos =  row, col #[row, col]
            @board[pos] == mark
        end
        left_to_right || right_to_left
    end
# Board#win?(mark)
# This method should return a boolean indicating whether or not the given mark has filled any full row, column, or diagonal.
    def win?(mark)
        self.win_diagonal?(mark) || self.win_row?(mark) || self.win_col?(mark)
    end
# Board#empty_positions?
# This method should return a boolean indicating whether or not there is at least one empty position on the grid.
    def empty_positions?
        @board.any? do |row|
            row.any? {|ele| ele == "_"}
        end
    end
end
