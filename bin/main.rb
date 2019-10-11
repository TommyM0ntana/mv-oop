#!/usr/bin/env ruby
# frozen_string_literal: true

class Game
  def initialize
    @player1 = ''
    @player2 = ''
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    # Greetings start
    puts 'Hello! Welcome, Lets PLAY TIC TAC TOE '

    # First player name (repeat until if empty):
    while @player1.empty?
      puts 'What is your name Player One'
      @player1 = gets.chomp
      puts 'Please repeat and insert your name Player One' if @player1.empty?
      next
    end

    # Second player name (repeat until if empty):
    while @player2.empty?
      puts 'What is your name Player Two'
      @player2 = gets.chomp
      puts 'Please repeat and insert your name Player Two' if @player2.empty?
      next
    end

    # Greetings wrap
    puts "Oki-doki, lets play  #{@player1} and #{@player2}.
    Let the best win Ready, Steady GOO..."

    # Display current board
    display

    # Loop moves until over
    until over?
      # Ask for move first player
      move(@player1)

      # Ask for move second player
      move(@player2)
    end

    result
  end

  def display
    puts ' '
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts ' --+---+---'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts ' --+---+---'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]}"
    puts ' '
  end

  def move(player)
    @square = nil
    until validate(@square)
      puts "Tell me your move, #{player} pick a square"
      @square = gets.chomp.to_i
    end
    display
  end

  def validate(square)
    return false if square.nil?

    unless square.between?(1, 9)
      puts 'Pick Integer from 1 to 9 '
      return false
    end

    true
  end

  def over?
    [true, false].sample
  end

  def winner
    ['Player One', 'Player Two', false].sample
  end

  def result
    if winner
      puts "Winner is #{winner}. One more? (Yes / No)"
    else
      puts 'It is a Draw guys, well played. One more? (Yes / No)'
    end
    Game.new if gets.chomp == 'Yes'
  end
end
Game.new
