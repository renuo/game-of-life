#!/usr/bin/env ruby

require_relative 'fake_game'
require_relative 'window'

w = Window.new

g = nil

if ENV['GAME_PATH']
  require_relative(ENV['GAME_PATH'])
  fields = if ENV['SCHEMA_PATH']
             file = File.read ENV['SCHEMA_PATH']
             schema_fields = []
             file.each_line do |line|
               row = []
               line.each_char do |c|
                 row << (c == 'O') ? true : false
               end
               schema_fields << row
             end
             schema_fields
           else
             FakeGame.random_field
           end
  g = Game.new(fields)
else
  g = FakeGame.new
end

loop do
  w.print(g)
  g.tick
  sleep(0.2)
end
