class Game
  def initialize(fields)
    @fields = fields
  end

  def tick
    @fields.each_with_index do |row, i|
      # puts "row: #{row}, i: #{i}"
      row.each_index do |j|
        @fields[i][j] = future_state(i, j)
      end
    end
  end

  def fields
    @fields
  end

  private

  def future_state(x, y)
    return false if (neighbors_count(x, y) < 2) || (neighbors_count(x, y) > 3)

    return true if neighbors_count(x, y) == 3
    return false if (neighbors_count(x, y) == 2) && @fields[x][y]

    false
  end

  def neighbors_count(x, y)
    sum = 0
    [x-1, x, x+1].each do |i|
      [y-1, y, y+1].each do |j|
        sum += 1 if @fields[i][j] rescue nil
      end
    end
    sum -= 1 if @fields[x][y]
    sum
  end

end
