require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(length)
        @player = Player.new
        @board = Board.new(length)
        @remaining_misses = ( @board.size ) / 2
    end 

    def start_game
        @board.place_random_ships
        
        puts "#{@board.num_ships}"

        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            p "you lose"
            return true 
        else   
            return false 
        end  
    end 

    def win?
        if @board.num_ships == 0
            p "you win"
            return true 
        else  
            return false 
        end   
    end 

    def game_over?
        self.win? or self.lose?
    end 

    def turn 
        position = @player.get_move

        @remaining_misses -= 1 if !@board.attack(position)
        @board.print
        puts "remaining misses, #{@remaining_misses}"
    end 
end
