class Game
  def initialize(fields)
    @alive_fields = []
    @fields = fields
  end

  def tick
    @fields = @fields.map.with_index do |row, x|
      @alive_fields[x] ||= []
      row.map.with_index do |field, y|
        @alive_fields[x][y] ||= 0
        will_live = will_live?(field, x, y)

        if @alive_fields[x][y] >= 3 && !will_live
          @fields[x][y] = :zombie
        end

        if will_live
          @alive_fields[x][y] += 1
        else
          @alive_fields[x][y] = 0
        end

        will_live
      end
    end
  end

  def will_live?(living, x, y)
    count = count_alive_neighbours(x, y)
    if living
      if count_zombie_neighbours(x, y) > 0
        return :zombie
      else
        return stays_alive?(count)
      end
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

  def count_zombie_neighbours(x, y)
    neighbours(x, y).count(:zombie)
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
