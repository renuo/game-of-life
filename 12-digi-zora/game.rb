class Game
  def initialize(fields)
    @fields = fields.map do |row|
    row.map { |cell| cell ? 0 : 1 }
  end
  end

  def tick
    @fields = @fields.map.with_index do |row, x|
      row.map.with_index do |value, y|
        new_value(value, neighbors_alive(x, y), neighbors_zombie(x, y))
      end
    end
  end

  def new_value(value, neighbors, zombie)
    return :zombie if value == :zombie # stays zombie
    return :zombie if zombie # neighbor is zombie
    return :zombie if value >= 3 && (neighbors < 2 || neighbors > 3) # dies and becomes zombie

    if(value > 0)
      return value + 1 if neighbors >= 2 && neighbors <= 3
    else
      return 1 if neighbors == 3
    end

    0
  end

  def adjencent_cell(x, y)
    [[x-1, y-1], [x-1, y], [x-1, y+1], [x, y-1], [x, y+1], [x+1, y-1], [x+1, y], [x+1, y+1]]
  end

  def neighbors_alive(x, y)
    adjencent_cell(x,y).count do |coordinates|
      if (coordinates[0] >= 0 && coordinates[1] >= 0 )
        @fields.fetch(coordinates[0], []).fetch(coordinates[1], false)
      end
    end
  end

  def neighbors_zombie(x, y)
    adjencent_cell(x,y).any? do |coordinates|
      @fields.fetch(coordinates[0], []).fetch(coordinates[1], false) == :zombie
    end
  end

  def fields
    @fields.map do |row|
      row.map do |cell|
        cell == :zombie ? :zombie : (cell > 0)
      end
    end
  end
end
