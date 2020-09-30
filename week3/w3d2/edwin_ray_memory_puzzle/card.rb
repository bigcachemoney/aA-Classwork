require "byebug"

class Card
    attr_reader :name, :card

    CARD_LETTERS = ("A".."Z").to_a
    @@card_letters_pos = 0

    def self.create_pair
        # debugger
        arr = []
        arr << Card.new(CARD_LETTERS[@@card_letters_pos % 26])
        arr << Card.new(CARD_LETTERS[@@card_letters_pos % 26])
        @@card_letters_pos += 1
        return arr
    end

    def initialize(name)
        @name = name
        @face_up = false
    end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end

    def to_s #representation of the card object, print name of value of the card, useful for #Board.render #hide or reveal here
        if @face_up
            return self.name
        else
            return " "
        end
    end

    def ==(other_card)
        self.name == other_card.name
    end
end

# card = Card.new("test")
# arr = []
# arr << Card.create_pair
# p arr