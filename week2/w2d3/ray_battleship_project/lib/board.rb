class Board

attr_reader :size

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n 
    end

    def [](position)
        row, col = position
        @grid[row][col]
    end

    def []=(position, val)
        row, col = position
        @grid[row][col] = val
    end

    def num_ships
        count = 0
        (0...@grid.length).each do |row|
            (0...@grid.length).each do |col|
                count += 1 if @grid[row][col] == :S
            end
        end
        count
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            puts 'you sunk my battleship!'
            #DO NOT USE PRINT, we made a custom print method
            return true
        else 
            self[position] = :X
            return false
        end
    end

    def place_random_ships
        quarter_ships = (@grid.length * @grid.length)/4

        while self.num_ships < quarter_ships
            temp1 = rand(0...@grid.length)
            temp2 = rand(0...@grid.length)
            position = [temp1, temp2]
            self[position] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |ele|
                if ele == :S 
                    :N 
                else  
                    ele  
                end 
            end  
        end
    end

    def self.print_grid(grid_arr)
        grid_arr.each do |row|  
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end

end

