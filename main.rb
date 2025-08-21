# frozen_string_literal: true

# main Ruby file

require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'lib/human_player'

# Board.display_board
# Board.add_symbol(1, 2, 'X')
# Board.add_symbol(2, 2, 'O')
loop do
  Game.new(HumanPlayer, HumanPlayer).play_game
  print 'Play another game? (y/n) '
  return unless gets.chomp == 'y'
end
