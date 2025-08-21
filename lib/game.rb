# frozen_string_literal: true

# first class is the board with 9 editable spaces in a 3x3 matrix layout
# This class should also display the board status to the screen
class Game
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
  attr_reader :board, :current_player_id

  def initialize(player1, player2)
    @board_matrix = Array.new(3) { Array.new(3, ' ') }
    @current_player_id = 0
    @players = [player1.new(self, 'X'), player2.new(self, 'O')]
    display_board
    puts
    puts "Player#{@current_player_id + 1} plays first"
  end

  def play_game
    loop do
      return false unless can_add_symbol?(current_player)

      switch_players!
    end
  end

  def current_player
    @players[@current_player_id]
  end

  def other_player_id
    1 - @current_player_id
  end

  def switch_players!
    @current_player_id = other_player_id
  end

  def opponent
    @players[@other_player_id]
  end

  def top_bottom_row
    puts '    1  2  3'
  end

  def display_board
    top_bottom_row
    @board_matrix.each_with_index { |row, index| puts "#{index + 1} | #{row.join('  ')} | #{index + 1}" }
    top_bottom_row
    puts
  end

  def can_add_symbol?(player)
    position = player.play_symbol!
    puts "#{player}#{@current_player_id + 1} selected #{player.symbol} for position (#{position.join(',')})"
    @board_matrix[position[0] - 1][position[1] - 1] = player.symbol
    display_board
    return false if game_won?(player) || game_tied?

    true
  end

  def player_won?(symbol)
    WINNING_CONDITIONS.each do |condition|
      won = true
      condition.each do |index|
        won &&= (@board_matrix.flatten[index - 1] == symbol)
      end
      return true if won == true
    end
    false
  end

  def game_won?(player)
    if player_won?(player.symbol)
      declare_winner(player)
      return true
    end
    false
  end

  def game_tied?
    if @board_matrix.flatten.none?(' ')
      puts 'The game is tied!'
      return true
    end
    false
  end

  def declare_winner(player)
    puts "#{player}#{@current_player_id + 1} won!"
  end

  def allowed_position?(row, col)
    @board_matrix[row][col] == ' '
  end

  def invalid_position(row, col)
    puts "There is already an #{@board_matrix[row - 1][col - 1]} at position #{row}, #{col}"
  end
end
