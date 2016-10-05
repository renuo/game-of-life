require_relative '../spec_helper'
require 'rspec'
require_relative '../../14-figge-benji/game'

RSpec.describe Game do
  let(:ary) { array = [[false, false, false, false, true],
                       [false, false, false, false, false],
                       [false, true, true, false, false],
                       [false, false, true, false, false],
                       [false, false, false, false, false]] }
  let(:game) { Game.new(:ary) }

  # it 'should return an array' do
  #   p game.fields
  #   expect(game.fields).to be_a_kind_of Array
  # end

  it 'initialise method' do
    expect(Game.new(ary).fields).to eq ary
  end

  it 'return neighbours' do
    expect(game.get_neighbours(2, 2)).to eq [false, false, false, true, false, false, true, false]
  end

  it 'returns edge case' do
    expect(game.get_neighbours(0, 0)).to eq [false, false, false]
  end

  it 'return count of neighbours' do
    expect(game.get_neighbours_count(game.get_neighbours(0,0))).to eq 3
  end
end
