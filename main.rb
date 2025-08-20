# frozen_string_literal: true

# first class is the board with 9 editable spaces in a 3x3 matrix layout
# This class should also display the board status to the screen
class Board
  WINNING_CONDITIONS = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [1, 4, 7],
    [2, 5, 8],
    [3, 6, 9],
    [1, 5, 9],
    [3, 5, 7]
  ].freeze

  @board_matrix = Array.new(3) { Array.new(3, ' ') }

  def self.top_bottom_row
    puts '    1  2  3'
  end

  def self.display_board
    top_bottom_row
    @board_matrix.each_with_index { |row, index| puts "#{index + 1} | #{row.join('  ')} | #{index + 1}" }
    top_bottom_row
  end

  def self.add_symbol(row, col, symbol)
    if @board_matrix[row - 1][col - 1] == ' '
      @board_matrix[row - 1][col - 1] = symbol
    else
      invalid_placement(row - 1, col - 1)
    end
    display_board
    check_for_winner(symbol)
  end

  def self.won?(symbol)
    WINNING_CONDITIONS.each do |condition|
      won = true
      condition.each do |index|
        won &&= (@board_matrix.flatten[index - 1] == symbol)
      end
      return true if won == true
    end
    false
  end

  def self.check_for_winner(symbol)
    if won?(symbol)
      declare_winner(symbol)
    elsif @board_matrix.flatten.none?(' ')
      puts 'The game is tied!'
      board_reset
    end
    display_board
  end

  def self.declare_winner(symbol)
    puts "Player #{symbol} won!"
    board_reset
  end

  def self.invalid_placement(row, col)
    puts "There is already an #{@board_matrix[row][col]} at position #{row + 1}, #{col + 1}"
  end

  def self.board_reset
    @board_matrix = Array.new(3) { Array.new(3, ' ') }
  end
end

Board.display_board
Board.add_symbol(1, 2, 'X')
Board.add_symbol(2, 2, 'O')
