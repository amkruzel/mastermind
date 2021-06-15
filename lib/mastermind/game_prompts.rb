# frozen_string_literal: true

# This module includes prompts to the user. It does not check for the validity of the responses
module GamePrompts
  def game_welcome
    puts "\n- Time to play Mastermind -"
    # sleep(2)
  end

  def game_rules
    puts "\nHere are the rules of the game:"
    puts '...'
    # sleep(5)
  end

  def guess_colors
    puts "\nPlease type your guesses, pressing 'Enter' after each."

    puts 'Guesses will go left to right.'

    puts "Options are: 'r' (#{'red'.red}), 'o' (#{'orange'.yellow}), 'g' (#{'green'.green}), 'b' (#{'blue'.blue}), 'p' (#{'purple'.magenta}), or 'y' (#{'yellow'.light_yellow})"
    # sleep(2)
  end

  def won
    puts 'You won!'
    true
  end

  def lost(pattern)
    puts "You lost :(\nThe answer was #{pattern}"
    true
  end

  def play_again?
    puts 'Do you want to play again? (y/n)'
    gets.chomp.downcase == 'y'
  end
end
