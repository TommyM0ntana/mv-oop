# frozen_string_literal: true

require_relative '../lib/board'

RSpec.describe Board, '#initialize' do
  context 'initialize with defaults' do
    let(:board) { Board.new }
    it 'squares is an Array' do
      expect(board.squares).to be_kind_of Array
    end
    it 'wins is an Array' do
      expect(board.wins).to be_kind_of Array
    end
    it 'moves is a Hash' do
      expect(board.moves).to be_kind_of Hash
    end
    it 'turn is a String' do
      expect(board.turn).to be_kind_of String
    end
    it 'over is false' do
      expect(board.over).to be false
    end
    it 'winner is nil' do
      expect(board.winner).to be_nil
    end
  end
end
RSpec.describe Board, '#move' do
  context 'make a move with nils' do
    let(:board) { Board.new }
    it 'return nil' do
      expect(board.move(nil, nil)).to be_nil
    end
  end
  context 'make a move with values' do
    let(:board) { Board.new }
    it 'return true' do
      expect(board.move('X', 2)).to be true
    end
  end
end
