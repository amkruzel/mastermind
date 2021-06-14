# frozen_string_literal: true

# This module includes prompts to the user. It does not check for the validity of the responses
module GamePrompts
  def game_welcome
    puts "\n- Time to play Mastermind -"
    sleep(2)
  end

  def game_rules
    puts "\nHere are the rules of the game:"
    puts '...'
    sleep(5)
  end

  def guess_colors
    puts "\nPlease type your guesses, pressing 'Enter' after each."

    puts 'Guesses will go left to right.'

    puts "Options are: 'r' (#{'red'.red}), 'o' (#{'orange'.yellow}), 'g' (#{'green'.green}), 'b' (#{'blue'.blue}), 'p' (#{'purple'.magenta}), or 'y' (#{'yellow'.light_yellow})"
    sleep(2)
  end

  def check_if_won
    puts 'You won!' && true if @cur_guesses == @computer_colors
  end

  def check_if_lost(round)
    puts 'You lost' && true if round == 11
  end
end
