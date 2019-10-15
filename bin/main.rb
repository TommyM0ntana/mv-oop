#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/game'

@repeat = true
def display(squares)
  return unless squares

  puts ' '
  puts " #{squares[0]} | #{squares[1]} | #{squares[2]}"
  puts ' --+---+---'
  puts " #{squares[3]} | #{squares[4]} | #{squares[5]}"
  puts ' --+---+---'
  puts " #{squares[6]} | #{squares[7]} | #{squares[8]}"
  puts ' '
end

def get_name(game, sign, name = nil)
  while name.nil? || name.empty?
    print "What is your name Player #{sign}: "
    name = gets.chomp.strip
    puts "Please repeat and insert your name #{sign}: " if name.empty?
    next
  end
  game.add_player(name, sign)
  name
end

def validate_move(moves, square)
  return false if square.nil?

  until square.between?(1, 9)
    puts 'Please pick Integer from 1 to 9 '
    return false
  end
  while (moves['X'] + moves['O']).include?(square)
    puts 'Square is taken. Please choose another one'
    return false
  end
  true
end

def get_move(game, name, sign, square = nil)
  until validate_move(game.board.moves, square)
    print "Tell me your move, #{name} pick a square: "
    square = gets.chomp.to_i
  end
  game.add_move(sign, square)
  display(game.board.squares)
end

def report_result(winner, p1, p2)
  if winner
    name = winner == 'X' ? p1 : p2
    text = "And we have the winner! It is #{name}!"
  else
    text = 'It is a Draw guys, well played!'
  end
  puts text
  puts 'One more? (Yes / No)'
  @repeat = false unless gets.chomp == 'Yes'
end

while @repeat
  puts 'Hello! Welcome, Lets PLAY TIC TAC TOE '
  game = Game.new
  p1 = get_name(game, 'X')
  p2 = get_name(game, 'O')
  puts "Oki-doki, lets play  #{p1} and #{p2}. Let the best win Ready, Steady GOO..."
  display(game.board.squares)
  game.board.turn == 'X' ? get_move(game, p1, 'X') : get_move(game, p2, 'O') until game.board.over
  report_result(game.board.winner, p1, p2)
end
