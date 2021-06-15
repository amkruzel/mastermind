# frozen_string_literal: true

require 'colorize'
require './mastermind/game_prompts'
require './mastermind/board'
require './mastermind/display_board'
require './mastermind/game_logic'
require 'pry'

# main program file for mastermind
class Game < Board
  include GamePrompts
  include DisplayBoard
  include GameLogic

  @round_no = 0

  attr_reader :round_no

  def initialize
    super
    game_welcome
    game_rules
    pick_colors # Will return @computer_colors, an array of four letters representing the colors that need to be guessed
    @round_no = 0
  end

  def play_round
    guess_colors # Prompt to input guesses

    collect_guesses # Will return @cur_guesses, an array with four letters representing player guesses

    evaluate_guesses(@cur_guesses, @computer_colors) # Does not return, but evaluates @correct_color_and_position and @correct_color to be integers

    @board[@round_no] = add_guesses_and_results(@board[@round_no], @cur_guesses) # Returns new board

    display_board(@board)

    @round_no += 1
  end

  def end_game
    won if game_won?(@cur_guesses, @computer_colors)
    lost if game_lost?(@round_no)
  end
end

game = Game.new

loop do
  game.play_round
  if game.end_game && game
end
