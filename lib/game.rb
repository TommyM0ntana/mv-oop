# frozen_string_literal: true

class Game
  require_relative 'player'
  require_relative 'board'
  attr_reader :board, :players
  def initialize
    @board = Board.new
    @players = []
  end

  def add_player(name, sign)
    @players << Player.new(name, sign)
  end

  def add_move(sign, square)
    return if !sign || !square

    @board.move(sign, square)
    true
  end
end
Game.new
