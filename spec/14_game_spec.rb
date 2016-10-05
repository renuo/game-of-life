require 'spec_helper'
require_relative '../14-digi-luke/game'


describe 'xxx' do
  let(:fields) { [[false] * 10] * 10 }
  let(:game) { Game.new(fields) }

  it do

  end

  describe '#fields' do
    subject { game.fields }
    it { is_expected.to eq(fields) }
  end

  describe '#neighbors_coordinates' do
    subject { game.neighbors_coordinates(3, 3) }
    it { is_expected.to eq([[2, 2], [2, 3], [2, 4], [3, 2], [3, 4], [4, 2], [4, 3], [4, 4]]) }
  end

  describe '#neigbors_alive' do
    let(:fields) { [[false, false, false], [false, true, false], [false, false, false]] }
    subject { game.neighbors_alive(*co) }

    describe '1, 1' do
      let(:co) { [1, 1] }
      it { is_expected.to be(0) }
    end

    describe '2, 1' do
      let(:co) { [2, 1] }
      it { is_expected.to be(1) }
    end

    describe 'overflow: -2, -1' do
      let(:fields) { [[true, false, true], [false, false, false], [false, false, false]] }
      let(:co) { [0, 0] }
      it { is_expected.to be(0) }
    end

    describe 'overflow: -2, -1' do
      let(:fields) { [[true, false, true], [false, false, false], [false, false, false]] }
      let(:co) { [0, 0] }
      it { is_expected.to be(0) }
    end
  end
end
