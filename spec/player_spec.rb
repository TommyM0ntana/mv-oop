# frozen_string_literal: true

require 'player'

RSpec.describe Player, '#initialize' do
  context 'initialize with nils' do
    let(:player) { Player.new(nil, nil) }
    it 'name is nil' do
      expect(player.name).to be_nil
    end
    it 'sign is nil' do
      expect(player.sign).to be_nil
    end
  end
  context 'initialize with truthy values' do
    let(:player) { Player.new('string', 'string') }
    it 'name has value' do
      expect(player.name).to be
    end
    it 'sign has value' do
      expect(player.sign).to be
    end
  end
end
