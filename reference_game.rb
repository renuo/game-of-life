class ReferenceGame
  def initialize(fields)
    @fields = fields
  end

  def tick
    new_fields = []
    fields.each_index do |x|
      fields[x].each_index do |y|
        new_fields[x] ||= []
        new_fields[x][y] = calculate_next_state(x, y)
      end
    end

    @fields = new_fields
  end

  def calculate_next_state(x, y)
    count = count_neighbours(x, y)
    if fields[x][y]
      return next_state_if_was_alive(count)
    else
      return next_state_if_was_dead(count)
    end
  end

  def count_neighbours(x, y)
    [
      field_alive?(x - 1, y - 1),
      field_alive?(x - 1, y),
      field_alive?(x - 1, y + 1),
      field_alive?(x, y - 1),
      field_alive?(x, y + 1),
      field_alive?(x + 1, y - 1),
      field_alive?(x + 1, y),
      field_alive?(x + 1, y + 1)
    ].map { |value| value ? 1 : 0 }.inject(&:+)
  end

  def field_alive?(xx, yy)
    return false if xx < 0 || yy < 0
    fields.fetch(xx, []).fetch(yy, false)
  end

  def next_state_if_was_alive(count)
    return count == 2 || count == 3
  end

  def next_state_if_was_dead(count)
    count == 3
  end

  def fields
    @fields
  end
end
