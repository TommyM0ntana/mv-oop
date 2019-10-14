# frozen_string_literal: true

class Board
  attr_reader :squares, :turn, :over, :winner, :moves
  def initialize
    @squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @wins = [[1, 4, 7], [2, 5, 8], [3, 6, 9], [3, 5, 7], [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 5, 9]]
    @moves = { 'X' => [], 'O' => [] }
    @turn = 'X'
    @over = false
    @winner = nil
  end

  def find_winner(sign)
    @winner = sign if @wins.any? { |w| w.all? { |e| @moves[sign].include?(e) } }
  end

  def move(sign, square)
    @squares = @squares.each_with_index.map { |e, i| i == square - 1 ? sign : e }
    @turn = @turn == 'X' ? 'O' : 'X'
    @moves[sign] << square
    find_winner(sign)
    @over = true if !@winner.nil? || (@moves['X'] + @moves['O']).length == 9
  end
end
