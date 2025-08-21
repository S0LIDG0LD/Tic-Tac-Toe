# frozen_string_literal: true

# main Ruby file

require_relative 'lib/player'
require.relative 'lib/board'

Board.display_board
Board.add_symbol(1, 2, 'X')
Board.add_symbol(2, 2, 'O')
