require_relative '../game'

RSpec.describe do

  let(:board) do
    [
      [true, true, false],
      [false, false, false],
      [true, false, false]
    ]
  end
  let(:board2) do
    [
      [false, false, false],
      [true, true, false],
      [false, false, false]
    ]
  end
  let(:game) { Game.new(board) }

  it '#initialize' do
    expect(game).to be_truthy
    expect(game.board).to eq(board)
  end

  it '#tick' do
    expect{ game.tick }.to_not raise_exception
    expect(game.board).to eq(board2)
  end
end
