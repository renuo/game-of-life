#!/usr/bin/env ruby

require_relative 'window'
require_relative 'reference_game'

class Main
  def run
    @fields = random_field(30, 0.5)
    @fields_cloned = @fields.map { |arr| arr.clone }
    window = Window.new
    game = load_game(ENV['GAME_PATH'])
    reference_game = ReferenceGame.new(@fields_cloned)
    game_loop(window, game, reference_game)
  end

  def game_loop(window, game, reference_game)
    100.times do
      compare_games(window, game, reference_game)
      game.tick
      reference_game.tick
    end
    puts 'All went well (probably), congrats!'
  end

  def compare_games(window, game, reference_game)
    if game.fields != reference_game.fields
      window.print(game)
      puts 'There was a difference, please press <Enter> to see it'
      gets
      window.print(reference_game)
      puts 'Press <Enter> to finish the routine'
      gets
      raise 'Bye'
    end
  end

  def load_game(path)
    real_game(path)
  end

  def real_game(path)
    require_relative(path)
    Game.new(@fields)
  end

  def random_field(size, alive_ratio)
    size.times.to_a.map { size.times.to_a.map { rand < alive_ratio } }
  end
end

Main.new.run
