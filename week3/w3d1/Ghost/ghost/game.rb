require_relative "./player.rb"
class Game
    @@dictionary = File.new("dictionary.txt").readlines.map(&:chomp).to_set

    def initialize(player1, player2)
        @fragment = ""
        @player1 = Player.new(player1)
        @player2 = Player.new(player2)
        @current_player = @player1
        @previous_player = @player2
    end

    def play_round
        round_is_over = false
        until round_is_over do
            round_is_over = !(take_turn(@current_player)) || round_over?(@fragment)
            next_player!
        end
        puts "#{@current_player.name} wins!"
        @previous_player
    end

    def next_player!
        @current_player, @previous_player = @previous_player, @current_player
    end

    def take_turn(player)
        guess = player.guess
        if valid_play?(guess)
            @fragment << guess
            true
        else
            false
        end
    end

    def valid_play?(guess)
        ("a".."z").include?(guess) && @@dictionary.any? {|word| word[0..@fragment.length] == @fragment + guess}
    end

    def round_over?(word)
        @@dictionary.include?(word)
    end

    def run
        until game_over?
            loser = play_round
            loser.loses!
            @fragment = ""
            puts "#{loser.name} loses the round!"
            puts "#{@player1.name}'s score is #{"GHOST"[0...@player1.losses]}, #{@player2.name}'s score is #{"GHOST"[0...@player2.losses]}"
        end
        loser = @player1.losses == 5 ? @player1 : @player2
        puts "#{loser.name} loses the game!"
    end

    def game_over?
        @player1.losses == 5 || @player2.losses == 5
    end

end