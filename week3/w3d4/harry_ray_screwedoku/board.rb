require 'byebug'
require_relative "tile"

class Board
  def self.empty_grid
    Array.new(9) do
      Array.new(9) { Tile.new(0) }
    end
  end

  def self.from_file(filename)
    rows = File.readlines(filename).map(&:chomp)
    tiles = rows.map do |row| #483921657
      nums = row.split("").map { |char| Integer(char) }
      #[1,2,3]
      nums.map { |num| Tile.new(num) } #1 -> new Tile object
      # debugger
    end

    self.new(tiles)
  end

  def initialize(grid = self.empty_grid)
    @grid = grid
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, value) #pos = [3,4], value = 1
    x, y = pos
    #  debugger
    tile = grid[x][y] #grid[pos] = grid[3,4]
    tile.value = value 
  end

  def columns
    rows.transpose
  end

  def render
    puts "  #{(0..8).to_a.join(" ")}"
    grid.each_with_index do |row, i|
      puts "#{i} #{row.join(" ")}"
    end
  end

  def rows
    grid #grid
  end

  def size
    grid.size
  end

  def solved?
    rows.all? { |row| solved_set?(row) } &&
      columns.all? { |col| solved_set?(col) } &&
      squares.all? { |square| solved_set?(square) }
  end

  def solved_set?(tiles)
    nums = tiles.map(&:value)
    nums.sort == (1..9).to_a #[1,2,3,4,5,6,7,8,9]
  end

  def square(idx)
    tiles = []
    x = (idx / 3) * 3
    y = (idx % 3) * 3

    (x...x + 3).each do |i|
      (y...y + 3).each do |j|
        tiles << self[[i, j]]
      end
    end

    tiles
  end

  def squares
    (0..8).to_a.map { |i| square(i) }
  end

  private
  attr_reader :grid
end
