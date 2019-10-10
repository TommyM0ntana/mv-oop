# frozen_string_literal: true

# Store board information
class Board
  attr_reader :squares, :wins, :turn, :end, :winner
  def initialize
    @squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @wins = [[0, 3, 6], [1, 4, 7], [2, 5, 8], [2, 4, 6], [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8]]
    @moves = { 'X' => [], 'O' => [] }
    @turn = true
    @end = false
    @winner = false
    print
  end

  def move(sign, square)
    @squares = @squares.each_with_index.map { |e, i| i == square - 1 ? sign : e }
    @turn = !@turn
    @moves[sign] << (square - 1)
    @end = true if won?(sign) || filled?
    print
    puts "#{sign}: #{@moves[sign]}"
  end

  def filled?
    @squares.all? { |e| e == 'O' || e == 'X' }
  end

  def won?(sign)
    res = @wins.any? { |w| w.all? { |e| @moves[sign].include?(e) } }
    @winner = sign if res
    res
  end

  def print
    puts ' '
    puts " #{@squares[0]} | #{@squares[1]} | #{@squares[2]}"
    puts ' --+---+---'
    puts " #{@squares[3]} | #{@squares[4]} | #{@squares[5]}"
    puts ' --+---+---'
    puts " #{@squares[6]} | #{@squares[7]} | #{@squares[8]}"
    puts ' '
  end
end
