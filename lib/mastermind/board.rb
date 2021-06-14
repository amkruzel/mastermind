# frozen_string_literal: true

require 'colorize'

# board states
class Board
  def initialize
    @board = Array.new(12, Array.new(4, 'o'.black.on_white))
  end
end
