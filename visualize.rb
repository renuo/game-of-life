#!/usr/bin/env ruby

require_relative 'window'

class Main
  def run
    window = Window.new
    game = load_game(ENV['GAME_PATH'])
    game_loop(window, game)
  end

  def game_loop(window, game)
    loop do
      window.print(game)
      game.tick
      sleep(1)
    end
  end

  def load_game(path)
    path ? real_game(path) : fake_game
  end

  def real_game(path)
    require_relative(path)
    Game.new(random_field(30, 0.5))
  end

  def fake_game
    require_relative 'fake_game'
    FakeGame.new
  end

  def random_field(size, alive_ratio)
    size.times.to_a.map { size.times.to_a.map { rand < alive_ratio } }
  end
end

Main.new.run
