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
    start_compare_loop(window, game, reference_game) if game.fields != reference_game.fields
  end

  def start_compare_loop(window, game, reference_game)
    show_reference_game = true

    loop do
      if show_reference_game
        print_game('Reference Game', reference_game, window)
      else
        print_game('Your Implementation', game, window)
      end
      show_reference_game = !show_reference_game
    end
    window.print(game)
  end

  def print_game(game_name, game_to_print, window)
    window.print(game_to_print)
    puts ''
    puts game_name
    puts ''
    puts 'Press <enter> to continue'
    gets
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
