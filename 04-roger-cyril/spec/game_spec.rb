require_relative '../game'

RSpec.describe do
  let(:start_board) do
    [
      [false, false, false, false],
      [false, true, true, false],
      [false, false, true, false],
      [false, false, false, false]
    ]
  end

  let(:tick_one_board) do
    [
      [false, false, false, false],
      [false, true, true, false],
      [false, true, true, false],
      [false, false, false, false]
    ]
  end

  let(:tick_two_board) do
    [
      [false, false, false, false],
      [false, true, true, false],
      [false, true, true, false],
      [false, false, false, false]
    ]
  end

  subject(:game) { Game.new(start_board) }
  subject(:ticked_game) do
    game.tick
    game
  end

  it '#initialize' do
    expect{game}.not_to raise_exception
    expect(game.fields).to eq(start_board)
  end

  it '#tick' do
    expect(ticked_game.fields).to eq(tick_one_board)
    expect(ticked_game.fields).to eq(tick_two_board)
  end

  it '#count_active_neighbours' do
    # TODO: implement yourself
  end
end
