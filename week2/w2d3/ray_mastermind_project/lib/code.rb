require "byebug"

class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    arr.each {|ch| return false if !POSSIBLE_PEGS.has_key?(ch.upcase)}

    return true
  end

  def initialize(arr)
    @pegs = []

    if Code.valid_pegs?(arr)
      @pegs = arr.map {|ch| ch.upcase}
    else  
      raise "entered invalid pegs"
    end
  end

  def self.random(num)

    new_arr = []

    num.times {new_arr << POSSIBLE_PEGS.keys.sample}
    Code.new(new_arr) 
  end

  def self.from_string(str)    
    Code.new(str.split(""))
  end

  def [](idx)
    return @pegs[idx]
  end

  def length
    return @pegs.length
  end


  def num_exact_matches(code)

    new_pegs = code.pegs 

    count = 0

    new_pegs.each_with_index do |peg1, index1|

          if @pegs[index1] == new_pegs[index1]
                  count += 1
          end 

    end 

    return count

  end 

  def num_near_matches(another_code)
    #original = RGRB
    #"B", "R", "Y", "Y" <<<<<<<<
    #"R", "G", "R", "B"

    new_pegs = another_code.pegs

    count = 0

      (0...@pegs.length).each do |index1|

      if @pegs.include?(new_pegs[index1]) && @pegs[index1] != new_pegs[index1]
        count += 1
      end 
    end 
      return count 
  end 

  def ==(another_code)
    self.pegs == another_code.pegs
  end
  
end
