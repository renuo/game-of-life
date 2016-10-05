class Game
  def initialize(fields)
    @fields = fields
  end

  def tick
    @fields = @fields.map.with_index do |row, x|
      row.map.with_index do |cell, y|
        change_state(cell, neighbours(x, y))
      end
    end
  end

  def get_field(x, y)
    !(x < 0 || y < 0) && @fields.fetch(x, []).fetch(y, false)
  end

  def change_state(current_state, n_neighbours)
    (n_neighbours == 3 || (current_state && n_neighbours == 2))
  end

  def neighbours(x, y)
    [
      [x-1, y-1], [x-1, y], [x-1, y+1],
      [x, y-1], [x, y+1],
      [x+1, y-1], [x+1, y], [x+1, y+1]
    ].map { |c| get_field(*c) }.count(true)
  end

  def fields
    @fields
  end
end
