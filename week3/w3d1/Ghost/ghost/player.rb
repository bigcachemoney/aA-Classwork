class Player
    attr_reader :name, :losses
    def initialize(name)
        @name = name
        @losses = 0
    end

    def guess
        puts "#{name} please enter a letter:"
        gets.chomp
    end

    def loses!
        @losses += 1
    end
end