# frozen_string_literal: true

# This class is needed to initiate a player playing the game
class Player
  attr_reader :symbol

  def initialize(board, symbol)
    @board = board
    @symbol = symbol
  end
end
