# frozen_string_literal: true

# This class is needed to add a Human Player in the game
class HumanPlayer < Player
  def play_symbol!
    loop do
      print "Select your #{symbol} position (row, column): "
      position = gets.split(',')
      position.map!(&:to_i)
      return position if @board.allowed_position?(position[0] - 1, position[1] - 1)

      @board.invalid_position(position[0], position[1])
    end
    @board.display_board
  end

  def to_s
    'Player'
  end
end
