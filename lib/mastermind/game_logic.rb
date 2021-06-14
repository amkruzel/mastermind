# frozen_string_literal: true

# logic for game
module GameLogic
  COLORIZE_COLORS = %w(red yellow green blue magenta light_yellow)
  HUMAN_COLORS = %w(red orange green blue purple yellow)
  COLOR_LETTERS = %w(r o g b p y)

  def pick_colors
    computer_colors = []
    4.times do
      computer_colors.push(HUMAN_COLORS[rand(1..6)])
    end
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
  end
end
