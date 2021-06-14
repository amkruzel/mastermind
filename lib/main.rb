# frozen_string_literal: true

require 'colorize'
require './mastermind/game_prompts'
require './mastermind/board'
require './mastermind/display'
require './mastermind/game_logic'
require 'pry'

# main program file for mastermind

# board_arr = Array.new(12, Array.new(4, 'o'.black.on_white))
# colorize_colors = {r: 'red', o: 'yellow', g: 'green', b: 'blue', p: 'magenta', y: 'light_yellow'}

# puts "\n"
# board_arr.each do |inner|
#   puts inner.join('')
# end

# colors = {red: 1, orange: 2, green: 3, blue: 4, purple: 5, yellow: 6}

# answer = []
# 4.times { answer.push(colors.key(rand(1..6))) }

# puts "What is your first guess?"
# puts "Please hit 'Enter' after each guess"
# puts "'r' for #{'red'.red}, 'o' for #{'orange'.yellow}, 'g' for #{'green'.green}, 'b' for #{'blue'.blue}, 'p' for #{'purple'.magenta}, or 'y' for #{'yellow'.light_yellow}"

# guess = []
# 4.times { guess.push(gets.chomp.to_sym) }
# board_arr[0].each_with_index do |spot, i|
#   spot = 'x'.(colorize_colors[guess[i]]).on_white
# end

# board_arr.each do |inner|
#   puts inner.join('')
# end

class Game < Board
  include GamePrompts
  include DisplayBoard
  include GameLogic

  @@round_no = 0

  def initialize
    super
    game_welcome
    game_rules
    guess_colors
    # display_board(@board)
    pick_colors # Will return @computer_colors, an array of four letters representing the colors that need to be guessed
    @@round_no = 0
  end

  def play_round
    collect_guesses # Will return @cur_guesses, an array with four letters representing player guesses

    evaluate_guesses # Does not return, but evaluates @correct_color_and_position and @correct_color to be integers

    @board[@@round_no] = add_guesses_and_results(@board[@@round_no], @cur_guesses) # Returns new board

    display_board(@board)

    if check_if_won || check_if_lost
      game_over
      break
    end

    @@round_no += 1
  end

  def game_over

  end
end

game = Game.new
game.play_round
