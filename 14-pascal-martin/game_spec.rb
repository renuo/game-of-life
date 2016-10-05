require_relative '../spec/spec_helper'
require_relative 'game'

describe 'Game' do
  it 'test for square' do
    square_pattern =[[false,false, false, false],
                     [false,true, true, false],
                     [false,true, true, false],
                     [false,false, false, false]]
    game = Game.new(square_pattern)

    game.tick

    expect(game.fields).to eq square_pattern
  end
  it 'test for Blinker' do
    blinker_pattern =[[false,false, false, false],
                      [false,true, false, false],
                      [false,true, false, false],
                      [false,true, false, false]]
    game = Game.new(blinker_pattern)
    blinker_after_pattern =[[false,false, false, false],
                      [false,false, false, false],
                      [true,true, true, false],
                      [false,false, false, false]]

    game.tick

    expect(game.fields).to eq blinker_after_pattern
  end
  it 'test for Beacon' do
    beacon_pattern = [[true,true, false, false],
                      [true,true, false, false],
                      [false,false, true, true],
                      [false,false, true, true]]
    game = Game.new(beacon_pattern)
    beacon_after_pattern  =[[true,true, false, false],
                            [true,false, false, false],
                            [false,false, false, true],
                            [false,false, true, true]]

    game.tick

    expect(game.fields).to eq beacon_after_pattern
  end

  it 'test for under' do
    pattern = [[false,false, false, false],
                      [false,false, false, false],
                      [false,true, false, false],
                      [false,false, false, false]]
    game = Game.new(pattern)
    after_pattern  =[[false,false, false, false],
                            [false,false, false, false],
                            [false,false, false, false],
                            [false,false, false, false]]

    game.tick

    expect(game.fields).to eq after_pattern
  end

  it 'test for over' do
    pattern = [[false,false, false, false],
               [false,true, false, false],
               [true,true, true, false],
               [false,false, false, false]]
    game = Game.new(pattern)
    after_pattern  =[[false,false, false, false],
                     [false,true, false, false],
                     [true,false, true, false],
                     [false,false, false, false]]

    game.tick

    expect(game.fields).to eq after_pattern
  end

  it 'test for Beacon 2 ticks' do
    beacon_pattern = [[true,true, false, false],
                      [true,true, false, false],
                      [false,false, true, true],
                      [false,false, true, true]]
    game = Game.new(beacon_pattern)
    beacon_after_pattern  =[[true,true, false, false],
                            [true,false, false, false],
                            [false,false, false, true],
                            [false,false, true, true]]

    game.tick

    expect(game.fields).to eq beacon_after_pattern

    game.tick

    expect(game.fields).to eq beacon_pattern
  end

end
