require 'spec_helper'
require './14-zora-simon/game'

RSpec.describe Game, type: :view do
  let(:game) { Game.new(fields) }
  let(:fields) { [[true, false, true],
                  [true, false, true],
                  [true, false, true]] }

  it 'has a private fields property' do
    expect(game.instance_variable_get(:@fields)).to eq(fields)
  end

  it 'returns fields as an array' do
    expect(game.fields).to eq(fields)
  end
 
  describe 'neighbour' do
    it 'returns the number of neighbours' do
      expect(game.neighbours(0,0)).to eq(1)
      expect(game.neighbours(1,1)).to eq(6)
      expect(game.neighbours(0,1)).to eq(4)
    end
  end

  describe 'next_state' do
    it 'expect a current state and a number of neighbours' do
      expect(game.next_state(true, 8)).to eq(false)
      expect(game.next_state(false, 3)).to eq(true)
    end
  end
end
