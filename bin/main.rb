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

    # First player name (repeat if empty):
    while @player1.nil? || @player1.empty?
      print 'What is your name Player One: '
      @player1 = gets.chomp
      print 'Please repeat and insert your name Player One: ' if @player1.empty?
      next
    end
    @player1 = Player.new(@player1, 'X')

    # Second player name (repeat until if empty):
    while @player2.nil? || @player2.empty?
      print 'What is your name Player Two: '
      @player2 = gets.chomp
      print 'Please repeat and insert your name Player Two: ' if @player2.empty?
      next
    end
    @player2 = Player.new(@player2, 'O')

    # Greetings wrap
    puts "Oki-doki, lets play  #{@player1.name} and #{@player2.name}.
    Let the best win Ready, Steady GOO..."

    # Iniitialize new board
    @board = Board.new

    # Print board's initial state
    display

    # Moves until the end
    @board.turn == 'X' ? move(@player1.name, @player1.sign) : move(@player2.name, @player2.sign) until @board.over

    # Declare result
    result(@board.winner)
  end

  # Valildate move input
  def valid(square)
    return false if square.nil?

    until square.between?(1, 9)
      puts 'Please pick Integer from 1 to 9 '
      return false
    end
    true
  end

  # Handle move
  def move(name, sign, square = nil)
    until valid(square)
      print "Tell me your move, #{name} pick a square: "
      square = gets.chomp.to_i
    end
    @board.move(sign, square)
    # Print current state
    display
  end

  # Announce result
  def result(winner)
    if winner
      name = winner == 'X' ? @player1.name : @player2.name
      text = "And we have the winner! It is #{name}!"
    else
      text = 'It is a Draw guys, well played!'
    end
    puts text
    puts 'One more? (Yes / No)'
    Game.new if gets.chomp == 'Yes'
  end

  # Print board
  def display
    squares = @board.squares
    puts ' '
    puts " #{squares[0]} | #{squares[1]} | #{squares[2]}"
    puts ' --+---+---'
    puts " #{squares[3]} | #{squares[4]} | #{squares[5]}"
    puts ' --+---+---'
    puts " #{squares[6]} | #{squares[7]} | #{squares[8]}"
    puts ' '
  end
end
Game.new
