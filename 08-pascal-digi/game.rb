class Game
  def initialize(fields)
    @fields = fields
  end

  def tick
    new_fields = @fields.dup
    @fields.each_with_index do |row, row_index|
      row.each_with_index do  |cell, cell_index|
        alive_neighbors = count_alive_neighbors(row_index, cell_index)
        new_fields[row_index][cell_index] = cell
        if underpolulated?(alive_neighbors) || overpolulated?(alive_neighbors)
        new_fields[row_index][cell_index] = false 
        elsif reproducting?(alive_neighbors)
        new_fields[row_index][cell_index] = true 
        end
      end
    end
    @fields = new_fields
  end

  def fields
    @fields
  end

  def underpolulated?(alive_neighbors)
    alive_neighbors < 2
  end

  def overpolulated?(alive_neighbors)
    alive_neighbors > 3
  end

  def reproducting?(alive_neighbors)
    alive_neighbors == 3
  end

  def count_alive_neighbors(y, x)
    [
      get_field(y-1, x-1),
      get_field(y-1, x),
      get_field(y-1, x+1),
      get_field(y, x-1),
      get_field(y, x+1),
      get_field(y+1, x-1),
      get_field(y+1, x),
      get_field(y+1, x+1)
    ].count { |cell| cell == true }
  end

  def get_field(y, x)
    return @fields[y][x] if y >= 0 && x >= 0 && y < @fields.count && x < @fields[y].count
    return false
  end
end
