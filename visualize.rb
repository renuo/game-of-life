#!/usr/bin/env ruby

require_relative 'fake_game'
require_relative 'window'

w = Window.new

g = nil

if ENV['GAME_PATH']
  require_relative(ENV['GAME_PATH'])
  g = Game.new(FakeGame.random_field)
else
  g = FakeGame.new
end

loop do
  w.print(g)
  g.tick
  sleep(1)
end
