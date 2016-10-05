require_relative 'characters'

class Window
  ALIVE = '◽ '
  DEAD = '◾ '
  ZOMBIE = Characters::SKULL

  def print(game)
    system('clear')
    puts convert_to_s(game)
  end

  def convert_to_s(game)
    game.fields.map do |row|
      row_strings = row.map do |cell|
        if cell == :zombie
          ZOMBIE
        else
          cell ? ALIVE : DEAD
        end
      end
      row_strings.join
    end.join("\n")
  end
end
