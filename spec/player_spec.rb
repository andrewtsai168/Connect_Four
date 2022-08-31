require 'rspec'
require './lib/board'
require './lib/player'

RSpec.describe Player do
  describe '#initialize' do
    it 'exists' do
      player = Player.new('Andrew')
      expect(player).to be_instance_of(Player)
    end

    it 'has a name' do
      player = Player.new('Andrew')
      expect(player.name).to eq('Andrew')
    end
  end




end
