# --format documentation --color

require 'tdd'
require 'rspec'

describe '#remove_dups' do
    context "an array gets passed containing duplicates" do
        it "removes duplicates from an array. It returns the unique elements in the order in which they first appeared" do
            expect(remove_dups([1,2,2,2,3,4])).to match_array([1,2,3,4])
        end
    end
end

describe '#two_sum' do
    context "takes in an array and returns a new array" do
        it "finds all pairs of positions where the elements at those positions sum to zero" do
            expect(two_sum([-1, 0, 2, -2, 1])).to match_array([[0, 4], [2, 3]])
        end
    end
end

describe '#my_transpose' do
    context "takes in a 2D array of with equal lengths for rows and cols" do
        it "it transposes the 2D array" do
            expect(my_transpose([[0, 1, 2],[3, 4, 5],[6, 7, 8]])).to match_array(([[0, 1, 2],[3, 4, 5],[6, 7, 8]]).transpose)
        end
    end
end

describe '#stock_picker'do
    context "find the most profitable stocks from an array" do
        it "find the indices of the days that gives the most profitable outcome, the first index is the day you purchased the stock" do
            expect(stock_picker([120, 100, 80, 50, 90, 70])).to match_array([3,4])
        end
    end
end

describe Tower do
    let(:tower) { Tower.new }
    #  @board = Array.new(3) {Array.new(3, [])}
    #     @pile1 = @board[0]
    #     pile1 = [1,2,3].shuffle
    #     @pile2 = @board[1]
    #     @pile3 = @board[2]
    describe "#move" do
        context "have 3 discs in 3 places" do
            it "moves one disc to another disc pole" do
                tower.board[0] = [1]
                tower.board[1] = []
                tower.board[2] = [2,3]
                tower.move("1","3")
                expect(tower.board).to match_array([[],[],[1,2,3]])
                
            end
        end
    end

    describe "#won?" do
        context "discs are arranged correctly on one pole" do
            it "return a win" do
                tower.board[0] = []
                tower.board[1] = []
                tower.board[2] = [1,2,3]
                state = false
                state = tower.won?
                expect(state).to eq(true)
            end
        end
    end

end