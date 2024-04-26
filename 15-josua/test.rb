require_relative 'game'

game = Game.new([
                  [true, true, true],
                  [false, false, false],
                  [false, false, false],
                ])


pp game.send(:alive_neighbor_count, 1, 1)
