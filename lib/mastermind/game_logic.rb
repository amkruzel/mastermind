# frozen_string_literal: true

# logic for game
module GameLogic
  COLORIZE_COLORS = %w(red yellow green blue magenta light_yellow)
  HUMAN_COLORS = %w(red orange green blue purple yellow)
  COLOR_LETTERS = %w(r o g b p y)

  def pick_colors
    @computer_colors = []
    4.times do
      @computer_colors.push(COLOR_LETTERS[rand(0..5)])
    end
    @computer_colors
  end

  def collect_guesses
    @cur_guesses = []
    4.times do
      player_guess = gets.chomp
      until COLOR_LETTERS.include?(player_guess)
        puts 'That is not a valid guess. Must be one of the six options.'
        player_guess = gets.chomp
      end
      @cur_guesses.push(player_guess)
    end
    @cur_guesses
  end

  def evaluate_guesses(guesses, answers)
    @correct_color_and_position = 0
    @correct_color = 0
    tmp_answers = answers.dup
    tmp_guesses = guesses.dup
    deletes = []

    tmp_guesses.each_with_index do |color, t|
      # If guess is exactly correct, add 1 to correct_color_and_position and go to next loop
      if tmp_answers[t] == color
        @correct_color_and_position += 1
        deletes.push(color)
      end
    end

    # Delete exact correct guesses form both arrays so they are not counted twice
    deletes.each do |clr|
      tmp_answers.delete_at(tmp_answers.index(clr))
      tmp_guesses.delete_at(tmp_guesses.index(clr))
    end
    deletes.clear

    tmp_guesses.each_with_index do |color, t|
      # Check if color is correct but in wrong position
      if tmp_answers.include?(color)
        @correct_color += 1
        tmp_answers[tmp_answers.index(color)] = ''
      end
    end
  end

  def game_won?(guess, correct)
    if guess == correct
      won
      true
    end
  end

  def game_lost?(round)
    if round == 12
      lost(@computer_colors)
      true
    end
  end

  def game_over
    @computer_colors.clear
    @board.clear
    @round_no = 0
    pick_colors
    @board = Array.new(12) { Array.new(4, 'o'.white) }

    play_again?
  end
end
