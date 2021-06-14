# frozen_string_literal: true

# logic for game
module GameLogic
  COLORIZE_COLORS = %w(red yellow green blue magenta light_yellow)
  HUMAN_COLORS = %w(red orange green blue purple yellow)
  COLOR_LETTERS = %w(r o g b p y)

  def pick_colors
    @computer_colors = []
    4.times do
      @computer_colors.push(COLOR_LETTERS[rand(1..6)])
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

  def evaluate_guesses
    @correct_color_and_position = 0
    @correct_color = 0
    tmp = @computer_colors

    4.times do |t|
      # If guess is exactly correct, add 1 to correct_color_and_position and go to next loop
      if @computer_colors[t] == @cur_guesses[t]
        @correct_color_and_position += 1
        @computer_colors.shift
      end
    end

    4.times do |t|
      # Check if color is correct but in wrong position
      if @computer_colors.include?(@cur_guesses[t])
        @correct_color += 1
        @computer_colors.delete(@cur_guesses[t])
      end
    end

    @computer_colors = tmp
  end
end
