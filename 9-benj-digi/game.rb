class Game
  def initialize(fields)
    @fields = fields
  end

  def tick
    @fields = @fields.map.with_index do |row, row_index|
      row.map.with_index do |cell, cell_index|
        cell_will_live?(cell, alive_neighbours(row_index, cell_index))
      end
    end
  end

  def fields
    @fields
  end

  def cell_will_live?(cell, alive_neighbours)
    return false if alive_neighbours > 3 || alive_neighbours < 2
    return true if alive_neighbours == 3
    cell
  end

  def alive_neighbours(x, y)
    [
      [x-1, y-1], [x-1, y], [x-1, y+1], [x, y-1], [x, y+1], [x+1, y-1], [x+1, y], [x+1, y+1]
    ].count { |coordinates| get_field(*coordinates) }
  end

  def get_field(x, y)
    @fields.fetch(x, []).fetch(y, false)
  end
end
