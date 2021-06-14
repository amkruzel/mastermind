# frozen_string_literal: true

# texts display
module DisplayBoard
  def display_board(board)
    puts "\n"
    board.each do |inner|
      puts inner.join('')
    end
  end
end
