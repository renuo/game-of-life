class Window
  ALIVE = '◽ '
  DEAD = '◾ '

  def print(game)
    system('clear')
    puts convert_to_s(game)
  end

  def convert_to_s(game)
    game.fields.map do |row|
      row_strings = row.map do |cell|
        cell ? ALIVE : DEAD
      end
      row_strings.join
    end.join("\n")
  end
end

