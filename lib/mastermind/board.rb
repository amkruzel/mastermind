# frozen_string_literal: true

require 'colorize'

# board states
class Board
  # COLORIZE_COLORS = %w(red yellow green blue magenta light_yellow)
  # HUMAN_COLORS = %w(red orange green blue purple yellow)
  # COLOR_LETTERS = %w(r o g b p y)
  INPUT_TO_X = {r: 'x'.red, o: 'x'.yellow, g: 'x'.green, b: 'x'.blue, p: 'x'.magenta, y: 'x'.light_yellow}


  def initialize
    @board = Array.new(12) { Array.new(4, 'o'.white) }
  end

  def add_guesses_and_results(board_row, player_guesses)
    # Edits current row of game board to show player guesses
    board_row.each_with_index { |_, i| board_row[i] = INPUT_TO_X[player_guesses[i].to_sym] }

    # Adds results to end of row
    board_row.push("\t#{@correct_color_and_position} correct color and position, #{@correct_color} correct color and incorrect position #{player_guesses}")

    board_row
  end
end
