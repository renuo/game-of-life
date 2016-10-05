class Game
  def initialize(fields)
    @fields = fields
  end

  def tick
    @fields = @fields.map.with_index do |row, x|
      row.map.with_index do |value, y|
        next_state(x, y, value)
      end
    end
  end

  def fields
    @fields
  end

  private

  def next_state(x, y, state)
    neighbours_count(x, y) == 3 || (neighbours_count(x, y) == 2 && state)
  end

  def neighbours_count(x, y)
    sum = (x-1..x+1).inject(0) do |sum, i|
      (y-1..y+1).inject(sum) do |sum, j|
        sum + (get_field(i, j) ? 1 : 0)
      end
    end
    sum - (get_field(x, y) ? 1 : 0)
  end

  def get_field(x, y)
    x += (x - x.abs) * @fields.length
    y += (y - y.abs) * @fields[0].length

    @fields.fetch(x, []).fetch(y, false)
  end
end
