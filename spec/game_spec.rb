# frozen_string_literal: true

require 'game'

RSpec.describe Game, '#initialize' do
  context 'initialize with defaults' do
    let(:game) { Game.new }
    it 'board is a Board' do
      expect(game.board).to be_kind_of Board
    end
    it 'players is an Array' do
      expect(game.players).to be_kind_of Array
    end
  end
end
RSpec.describe Game, '#add_move' do
  context 'add a move with nils' do
    let(:game) { Game.new }
    it 'return nil' do
      expect(game.add_move(nil, nil)).to be_nil
    end
  end
  context 'add a move with values' do
    let(:game) { Game.new }
    it 'return true' do
      expect(game.add_move('X', 2)).to be true
    end
  end
end
RSpec.describe Game, '#add_player' do
  context 'add a player with nils' do
    let(:game) { Game.new }
    it 'return nil' do
      expect(game.add_player(nil, nil)).to be_nil
    end
  end
  context 'add a player with values' do
    let(:game) { Game.new }
    it 'return true' do
      expect(game.add_player('Alex', 'X')).to be true
    end
  end
end
