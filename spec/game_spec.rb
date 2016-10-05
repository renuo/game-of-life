require 'spec_helper'
require './14-zora-simon/game'

RSpec.describe Game, type: :view do
  let(:game) { Game.new(fields) }
  let(:fields) { [1, 2, 3] }

  it 'has a private fields property' do
    expect(game.instance_variable_get(:@fields)).to eq(fields)
  end
end
