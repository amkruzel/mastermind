# frozen_string_literal: true

# texts display
module Display
  def begin_play
    puts 'Time to play Mastermind!'
  end

  def ask_for_input
    puts "What is your guess? Press 'Enter' after each guess."
    puts "Possible guesses are:
    'r' for red
    'y' for yellow
    'g' for green
    'b' for blue
    'p' for purple
    'o' for orange"
  end
end
