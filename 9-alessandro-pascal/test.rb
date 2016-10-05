require_relative 'game.rb'
class GameTest
  def initialize
    game = Game.new([[false, false, false, false],
                    [false, true, true, false],
                    [false, true, true, false],
                    [false, false, false, false]])
    game.tick
    new_fields = game.fields
    puts new_fields.inspect
  end
end

