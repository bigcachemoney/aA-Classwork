class Player
  def get_move
    # print "enter a position: "
    # gets.chomp.split.map(&:to_i)
        puts 'enter a position with coordinates separated with a space like `4 7`'
        #`4 7`
        response = gets.chomp.split
        response.map {|ele| ele.to_i}

  end
end
