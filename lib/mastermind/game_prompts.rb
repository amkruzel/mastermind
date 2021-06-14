# frozen_string_literal: true

# prompts to the player
module GamePrompts
  def game_welcome
    puts '- Time to play Mastermind -'
  end

  def game_rules
  end

  def guess_colors
    puts "Please type your guesses, pressing 'Enter' after each."

    puts 'Guesses will go left to right.'

    puts "Options are: 'r' (#{'red'.red}), 'o' (#{'orange'.yellow}), 'g' (#{'green'.green}), 'b' (#{'blue'.blue}), 'p' (#{'purple'.magenta}), or 'y' (#{'yellow'.light_yellow})"
  end
end