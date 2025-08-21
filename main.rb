# frozen_string_literal: true

# main Ruby file

require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'lib/human_player'

# Board.display_board
# Board.add_symbol(1, 2, 'X')
# Board.add_symbol(2, 2, 'O')

Game.new(HumanPlayer, HumanPlayer).play_game
