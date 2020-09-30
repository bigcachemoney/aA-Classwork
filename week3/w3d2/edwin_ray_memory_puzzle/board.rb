require_relative "./card.rb"
require "byebug"
class Board
    attr_reader :grid, :size
    def initialize(size=4)
        @size = size
        if size.even?
            @grid = Array.new(size) {Array.new(size, " ")}
        else
            raise 'size cannot be an odd number'
        end
        @populate_num = (size*size) / 2
    end

    def [](pos) #
        x, y = pos
        @grid[x][y]
    end

    def []=(pos, ele)
        x, y = pos
        @grid[x][y] = ele
    end

    def populate
        card_array = []
        @populate_num.times do
           card_array << Card.create_pair
        end
        # debugger
        card_array.flatten!
        card_array.shuffle!

        #array.shuffle. iterate through array, add ele
        #pop(ele) and add pop(ele) into @grid
        @grid.each_with_index do |sub_arr, idx1|
            sub_arr.each_with_index do |ele, idx2|
                @grid[idx1][idx2] = card_array.pop #popping #<Card:0x00007ffb4451cab0 @face_up=false, @name="E">
                    #grid[x][y] = #<Card:0x00007ffb4451cab0 @face_up=false, @name="E">     
            end
        end 
        #get elements into a random position [x][y]
        #check if position is nil before assigning
    end

    def render
        render_arr = []
        @grid.each do |sub_arr|
            render_arr << sub_arr.map { |card| card.to_s }
        end
        top_arr = [" "]
        top_arr << (0...size).to_a
        top_arr.flatten!
        puts "#{top_arr.join(" ")}"

        (0...@grid.length).each do |i|
            puts "#{i} #{render_arr[i].join(" ")}"
        end
        #   0 1 2 3    
        # 0 N N N N
        # 1 N N N N
        # 2 N N N N
        # 3 N N N N
    end

    def won? #should return true if all cards have been revealed.
        win_arr = []
        @grid.each do |sub_arr|
            win_arr << sub_arr.map { |card| card.to_s }
        end

        win_arr.each do |row|
            row.any? {|ele| return false if ele == " "}
        end
        true
    end

    ###reveal 
    #should reveal a Card at guessed_pos (unless it's already face-up, in which case the method should do nothing). It should also return the value of the card it revealed. 
    def reveal(pos) #pos = [2,3]
        @grid[pos[0]][pos[1]].reveal
        self.render
        card_letter = @grid[pos[0]][pos[1]].name
        return card_letter #"U"
    end 
end
