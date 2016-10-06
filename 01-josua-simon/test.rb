require './game.rb'

game = Game.new([
                    [false,false,false],
                    [true,false,true],
                    [false,false,false]
                ])

puts game.tick.inspect
