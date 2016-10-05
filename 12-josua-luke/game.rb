class Game
  def initialize(fields)
    @fields = fields
  end

  def tick
    @fields = @fields.map.with_index do |row, x|
      row.map.with_index do |field, y|
        count = count_alive_neighbours(x, y)
        will_live?(field, count)
      end
    end
  end

  def will_live?(living, count)
    if living
      stays_alive?(count)
    else
      becomes_alive?(count)
    end
  end

  def becomes_alive?(count)
    count == 3
  end

  def stays_alive?(count)
    count == 2 || count == 3
  end

  def count_alive_neighbours(x, y)
    neighbours(x, y).count(true)
  end

  def neighbours(x, y)
    [
      field(x-1, y-1),
      field(x-1, y),
      field(x-1, y+1),
      field(x, y-1),
      field(x, y+1),
      field(x+1, y-1),
      field(x+1, y),
      field(x+1, y+1)
    ]
  end

  def field(x, y)
    return false if x < 0 || y < 0
    return false if x >= @fields.size || y >= @fields[0].size
    @fields[x][y]
  end

  def fields
    @fields
  end
end
