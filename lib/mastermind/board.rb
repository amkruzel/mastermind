# frozen_string_literal: true

require 'colorize'

# board states
class Board
  # COLORIZE_COLORS = %w(red yellow green blue magenta light_yellow)
  # HUMAN_COLORS = %w(red orange green blue purple yellow)
  # COLOR_LETTERS = %w(r o g b p y)
  INPUT_TO_X = {r: 'x'.red.on_white, o: 'x'.yellow.on_white, g: 'x'.green.on_white, b: 'b'.blue.on_white, p: 'p'.magenta.on_white, y: 'x'.light_yellow.on_white}


  def initialize
    @board = Array.new(12, Array.new(4, 'o'.black.on_white))
  end

  def add_guesses_and_results(board, player_guesses, round)
    # Edits current row of game board to show player guesses
    board[round].each_with_index { |_, i| board[round][i] = INPUT_TO_X[player_guesses[i].to_sym] }

    # Adds results to end of row
    board[round].push("#{@correct_color_and_position} correct color and position, #{@correct_color} correct color and incorrect position")

    board
  end
end
