#!/usr/bin/env ruby

require_relative 'fake_game'
require_relative 'window'

window = Window.new

game = nil

if ENV['GAME_PATH']
  require_relative(ENV['GAME_PATH'])
  game = Game.new(random_field)
else
  game = Game.new
end

loop do
  window.print(game)
  game.tick
  sleep(1)
end

def random_field(size = 30, alive_ratio = 0.5)
  size.times.to_a.map { |row| size.times.to_a.map { rand < alive_ratio } }
end
