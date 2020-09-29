class Board
    attr_reader :max_height
    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end

    def self.build_stacks(stacks)#num
        stacks = Array.new(stacks) {Array.new}
    end

    def initialize(stacks, height)
        @max_height = height
        if stacks < 4 or height < 4
            raise 'rows and cols must be >= 4'
        else
            @stacks = Board.build_stacks(stacks) 
        end
    end

    def add(token, idx)
        if @stacks[idx].length < @max_height
            @stacks[idx] << token
            return true
        else 
            false
        end
    end

    def vertical_winner?(token)
        @stacks.each do |row|
            if row.length == @max_height 
                return true if row.all? {|ele| ele == token }
            end
        end
        false
    end

    def horizontal_winner?(token)
        # minimum = @stacks.map{|stack| stack.length}.min 

        i = 0
        while i < @stacks.length #minimum
            j = 0
            count = 0 
            while j < @stacks.length #minimum
                if @stacks[j][i] == token
                    count += 1 
                else
                    break
                end

                return true if count == @stacks.length
            j += 1
            end
        i += 1
        end
        false
    end

    def winner?(token)
        self.horizontal_winner?(token) || self.vertical_winner?(token)
    end
end
