require_relative '../spec_helper'
require_relative '../../game'

RSpec.describe Game do

  let(:board) { [
    [false, false, false, false],
    [false, false, true, true],
    [false, false, false, false],
    [false, false, false, false]
  ]
  }
  let(:game) { Game.new(board) }

  describe '#tick' do
    subject { game.tick }

    it { is_expected.not_to raise }
  end
end
