class Field
  attr_reader :x, :y, :state
  attr_accessor :neighbors

  def initialize(x, y, state)
    @x = x
    @y = y
    @state = state
  end

  def lives?
    return false if alive_neighbor_count < 2 || alive_neighbor_count > 3
    return true if alive_neighbor_count == 3
    @state
  end

  def alive_neighbor_count
    @neighbors.count { |field| field.state }
  end
end

class Game
  def initialize(fields)
    @fields = fields.map.with_index do |row, x|
      row.map.with_index do |state, y|
        Field.new(x, y, state)
      end
    end.flatten

    @fields.each do |field|
      field.neighbors = @fields.select do |ff|
        (ff.x - 1 == field.x && ff.y - 1 == field.y) ||
        (ff.x == field.x && ff.y - 1 == field.y) ||
        (ff.x + 1 == field.x && ff.y - 1 == field.y) ||

        (ff.x == field.x && ff.y - 1 == field.y) ||
        (ff.x == field.x && ff.y + 1 == field.y) ||

        (ff.x + 1 == field.x && ff.y + 1 == field.y) ||
        (ff.x == field.x && ff.y + 1 == field.y) ||
        (ff.x - 1 == field.x && ff.y + 1 == field.y)
      end
    end
  end

  def tick
    @resulting_fields = @fields.group_by { |field| field.y }.values.map { |field| field.lives? }
  end

  def fields
    @resulting_fields
  end
end
