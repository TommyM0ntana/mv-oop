# frozen_string_literal: true

# Store board information
class Board
  attr_reader :squares, :wins, :turn, :over, :winner
  def initialize
    # Available squares
    @squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    # Win combinations
    @wins = [[1, 4, 7], [2, 5, 8], [3, 6, 9], [3, 5, 7], [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 5, 9]]
    # Players moves history
    @moves = { 'X' => [], 'O' => [] }
    # Who's move
    @turn = 'X'
    # Game over?
    @over = false
    # Is there the winner?
    @winner = nil
  end

  # Name winner if there is one
  def find_winner(sign)
    @winner = sign if @wins.any? { |w| w.all? { |e| @moves[sign].include?(e) } }
  end

  # Process move
  def move(sign, square)
    # Mark square
    @squares = @squares.each_with_index.map { |e, i| i == square - 1 ? sign : e }
    # Swap move turn
    @turn = @turn == 'X' ? 'O' : 'X'
    # Update moves history
    @moves[sign] << square
    # Check if there is a winner
    find_winner(sign)
    # Check if game over
    @over = true if !@winner.nil? || (@moves['X'] + @moves['O']).length == 9
  end
end
