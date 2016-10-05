class Game
  def initialize(fields)
    @fields = fields
  end

  def tick
    @fields = @fields.map.with_index do |row, x|
      row.map.with_index do |value, y|
        neigbours = neighbours_alive(x, y)
        value ? [2, 3].include?(neigbours) : neigbours == 3
      end
    end
  end

  def neighbours_alive(x, y)
    [[x-1, y-1], [x-1, y], [x-1, y+1], [x, y-1], [x, y+1], [x+1, y-1], [x+1, y], [x+1, y+1]].count do |coordinates|
      if (coordinates[0] >= 0 && coordinates[1] >= 0 )
      @fields.fetch(coordinates[0], []).fetch(coordinates[1], false)
      end
    end
  end

  def fields
    @fields
  end
end
