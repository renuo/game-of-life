require_relative '../spec/spec_helper'
require_relative 'game'


RSpec.describe Game do
  let(:x) { true }
  let(:o) { false }
  let(:r) { rand(4).odd? }
  it 'works very simple with x' do
    game = Game.new([[x]])
    game.tick
    expect(game.fields).to eq [[x]]
  end

  it 'works very simple with o' do
    game = Game.new([[o]])
    game.tick
    expect(game.fields).to eq [[o]]
  end

  it 'works very simple with a small matrix' do
    game = Game.new([[o, o, o], [o, x, o], [o, o, o]])
    game.tick
    expect(game.fields).to eq([[o, o, o], [o, o, o], [o, o, o]])
  end

  it 'still lifes' do
    game = Game.new([[o, o, o, o],
                     [o, x, x, o],
                     [o, x, x, o],
                     [o, o, o, o]])
    game.tick
    expect(game.fields).to eq([[o, o, o, o],
                               [o, x, x, o],
                               [o, x, x, o],
                               [o, o, o, o]])
  end


  it 'period 2 oscillator' do
    period1 = [[o, o, o, o, o, o],
               [o, o, o, o, o, o],
               [o, o, x, x, x, o],
               [o, x, x, x, o, o],
               [o, o, o, o, o, o],
               [o, o, o, o, o, o]]
    period2 =[[o, o, o, o, o, o],
              [o, o, o, x, o, o],
              [o, x, o, o, x, o],
              [o, x, o, o, x, o],
              [o, o, x, o, o, o],
              [o, o, o, o, o, o]]
    game = Game.new(period1)
    game.tick
    expect(game.fields).to eq(period2)
    game.tick
    expect(game.fields).to eq(period1)
    100.times do |i|
      game.tick
      expect(game.fields).to eq(i.odd? ? period1 : period2)
    end
  end

  it 'random' do

    period1 = [[r,r,r,r,r],
               [r,r,r,r,r],
               [r,r,r,r,r],
               [r,r,r,r,r],
               [r,r,r,r,r]]

    game = Game.new(period1)
    game.tick
    fields = game.fields
    if (fields[3][3])
      expect(fields[]).to eq(period2)
      game.tick
      expect(game.fields).to eq(period1)
      100.times do |i|
        game.tick
        expect(game.fields).to eq(i.odd? ? period1 : period2)
      end
    else

    end

  end

end
