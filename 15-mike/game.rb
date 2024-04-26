class Game
  def initialize(fields)
    @fields = fields
  end

  def tick
    old_fields = @fields.map(&:dup)
    @fields = old_fields.each_with_index.map do |row, x|
      row.each_with_index.map do |cell, y|
        new_state(x, y, old_fields)
      end
    end
  end

  def new_state x, y, old_fields
    cell = old_fields[x][y]
    if live?(cell)
      unless (2..3).include? live_neighbours(x, y, old_fields)
        return false
      end
    else
      if live_neighbours(x, y, old_fields) == 3
        return true
      end
    end
    cell
  end

  def live?(cell)
    !!cell
  end

  def live_neighbours(x, y, fields)
    count = 0
    if x > 0
      count += 1 if fields[x - 1][y - 1]
      count += 1 if fields[x - 1][y]
      count += 1 if fields[x - 1][y + 1]
    end
    if x < fields.size - 1
      count += 1 if fields[x + 1][y - 1]
      count += 1 if fields[x + 1][y]
      count += 1 if fields[x + 1][y + 1]
    end
    row = fields[x]
    if y > 0
      count += 1 if fields[x][y - 1]
    end
    if y < row.size - 1
      count += 1 if fields[x][y + 1]
    end
    count
  end

  def random_field(size, alive_ratio)
    size.times.to_a.map { size.times.to_a.map { rand < alive_ratio } }
  end

  def fields
    @fields
  end
end
