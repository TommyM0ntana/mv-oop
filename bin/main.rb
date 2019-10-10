#!/usr/bin/env ruby
# frozen_string_literal: true

class Game
  require_relative '../lib/player'
  require_relative '../lib/board'
  def initialize
    @player1 = nil
    @player2 = nil
    @board = nil

    # Greetings start
    puts 'Hello! Welcome, Lets PLAY TIC TAC TOE '

    # First player name (repeat until if empty):
    while @player1.nil? || @player1.empty?
      puts 'What is your name Player One'
      @player1 = gets.chomp
      puts 'Please repeat and insert your name Player One' if @player1.empty?
      next
    end
    @player1 = Player.new(@player1, 'X')

    # Second player name (repeat until if empty):
    while @player2.nil? || @player2.empty?
      puts 'What is your name Player Two'
      @player2 = gets.chomp
      puts 'Please repeat and insert your name Player Two' if @player2.empty?
      next
    end
    @player2 = Player.new(@player2, 'O')

    # Greetings wrap
    puts "Oki-doki, lets play  #{@player1.name} and #{@player2.name}.
    Let the best win Ready, Steady GOO..."

    # Display current board
    @board = Board.new

    # Moves until the end
    @board.turn ? move(@player1.name) : move(@player2.name) until @board.end

    # Declare result
    result(@board.winner)
  end

  def move(player)
    @square = nil
    while @square.nil? || @square > 9 || @square < 1
      puts "Tell me you move, #{player} pick a square"
      @square = gets.chomp.to_i # TODO: So far we have zero input validation. Need to check if it is Integer, if it in range (1-9), if square is not taken
    end
    @board.turn ? @board.move(@player1.sign, @square) : @board.move(@player2.sign, @square)
  end

  def result(winner)
    if winner
      name = winner == 'X' ? @player1.name : @player2.name
      text = "And we have the winner! It is #{name}!"
    else
      text = 'It is a Draw guys, well played'
    end
    puts text
    puts 'One more? (Yes / No)'
    Game.new if gets.chomp == 'Yes'
  end
end
Game.new
