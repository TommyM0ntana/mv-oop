#!/usr/bin/env ruby
# frozen_string_literal: true

class Game
  def initialize
    @player1 = ''
    @player2 = ''
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    # Greetings start
    puts 'Hello! Welcome, Lets PLAY TIC TAC TOE ' # TODO: Need beautiful greeting

    # First player name (repeat until if empty):
    while @player1.empty?
      puts 'What is your name Player One'  # TODO: Ask name of first player
      @player1 = gets.chomp
      puts 'Please repeat and insert your name Player One' if @player1.empty? # TODO: Report about empty inpit and ask again
      next
    end

    # Second player name (repeat until if empty):
    while @player2.empty?
      puts 'What is your name Player Two' # TODO: Ask name of second player
      @player2 = gets.chomp
      puts 'Please repeat and insert your name Player Two' if @player2.empty? # TODO: Report about empty inpit  and ask again
      next
    end

    # Greetings wrap
    puts "Oki-doki, lets play  #{@player1} and #{@player2}. 
    Let the best win Ready, Steady GOO..." # TODO: Wrap up greeting and announce game start

    # Display current board
    display

    # Ask for move first player
    move(@player1)

    # Ask for move second player
    move(@player2)

    # Declare result
    result('Draw')
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
    while @square.nil? || @square > 9 || @square < 1
      puts "Tell me you move, #{player} pick a square" # TODO: Ask for move
      begin
        @square = gets.chomp
        @square = Integer(@square)
      rescue ArgumentError
        puts "Pick Integer from 1 to 9 .Tell me you move, #{player} pick a square!"  # TODO: Ask again if input invalid 
        retry
      end
    end
  end

  def result(res)
    puts "It is a #{res} guys, well played. One more? (Yes / No)" # TODO: Declare result and ask for new game
    Game.new if gets.chomp == 'Yes'
  end
end
Game.new





