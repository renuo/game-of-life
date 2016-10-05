class Game
  def initialize(fields)
    @fields = fields
  end

  def tick
    @fields = @fields.map.with_index do |row, x|
      row.map.with_index do |state, y|
        next_state(state, neighbours(x, y))
      end
    end
  end

  def fields
    @fields
  end

  private

  def neighbours(x, y)
    [
      [x - 1, y - 1], [x - 1, y], [x - 1, y + 1],
      [x, y - 1], [x, y + 1],
      [x + 1, y - 1], [x + 1, y], [x + 1, y + 1],
    ].map { |c| get_field(*c) }.count { |c| 1 if c }
  end

  def get_field(x, y)
    return false if (x < 0 || y < 0)
    @fields.fetch(x, []).fetch(y, false)
  end

  def next_state(state, neighbours)
    neighbours == 3 || (state && neighbours == 2)
  end
end
