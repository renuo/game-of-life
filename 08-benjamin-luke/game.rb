class Game
  def initialize(fields)
    @fields = fields
  end

  def tick
    @new_fields = []

    fields.each_index do |x|
      fields[x].each_index do |y|
        @new_fields[x] ||= []
        @new_fields[x][y] = calculate_field(x, y)
      end
    end

    @fields = @new_fields
  end

  def calculate_field(x, y)
    count = count_neighbours(x, y)
    fields[x][y] ? stays_alive?(count) : becomes_alive?(count)
  end

  def becomes_alive?(count)
    count == 3
  end

  def stays_alive?(count)
    count <= 3 && count >= 2
  end

  def count_neighbours(x, y)
    [
      value_of_field(x - 1, y - 1),
      value_of_field(x - 1, y),
      value_of_field(x - 1, y + 1),
      value_of_field(x, y - 1),
      value_of_field(x, y + 1),
      value_of_field(x + 1, y - 1),
      value_of_field(x + 1, y),
      value_of_field(x + 1, y + 1)
    ].count { |value| value }
  end

  def value_of_field(x, y)
    fields.fetch(x, []).fetch(y, false)
  end

  def fields
    @fields
  end
end
