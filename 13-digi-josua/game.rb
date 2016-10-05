class Game
  def initialize(fields)
    @fields = fields
  end

  def tick
    @fields = @fields.map.with_index do |row, x|
      row.map.with_index do |field, y|
        will_live?(field, count_alive_neighbors(x, y))
      end
    end
  end

  def will_live?(field, count)
    [false, false, field, true, false, false, false, false][count]
  end

  def count_alive_neighbors(x, y)
    [
      [x-1, y-1], [x-1, y], [x-1, y+1],
      [x, y-1], [x, y+1],
      [x+1, y-1], [x+1, y], [x+1, y+1]
    ].count { |coordinate_pair| field(*coordinate_pair) }
  end

  def field(x, y)
    x >= 0 && y >= 0 && x < @fields.size && y < @fields[x].size && @fields[x][y]
  end

  def fields
    @fields
  end
end
