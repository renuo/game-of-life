class Game
  def initialize(fields)
    @fields = fields
  end

  def tick
    @fields = @fields.map.with_index do |row, x|
      row.map.with_index do |value, y|
        calculate_next_value(value, x, y)
      end
    end
  end

  def calculate_next_value(currently_alive, x, y)
    count = neighbours(x, y).count(true)
    stays_alive?(currently_alive, count) || awakens?(currently_alive, count)
  end

  def awakens?(currently_alive, count)
    currently_alive && count == 2 || count == 3
  end

  def stays_alive?(currently_alive, count)
    !currently_alive && count == 3
  end

  def neighbours(x, y)
    indices = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
    indices.map do |x_offset, y_offset|
      field(x + x_offset, y + y_offset)
    end
  end

  def field(x, y)
    x != -1 && y != -1 && @fields.fetch(x, []).fetch(y, false)
  end

  def fields
    @fields
  end
end
