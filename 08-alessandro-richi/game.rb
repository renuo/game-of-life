class Game
  def initialize(fields)
    @fields = fields
  end

  def tick
    @fields = @fields.map.with_index do |row, i|
      row.map.with_index do |cell, j|
        old_state = cell
        n_alive_neighbors = count_alive_neighbors(i, j)
        new_state(old_state, n_alive_neighbors)
      end
    end
  end

  def count_alive_neighbors(i, j)
    sum = 0
    top = i-1
    left = j-1
    bottom = i+1
    right = j+1
    has_top_neighbors = top >= 0
    has_bottom_neighbors = (bottom < @fields.count)
    if left >= 0
      sum += 1 if has_top_neighbors and @fields[top][left]
      sum += 1 if @fields[i][left]
      sum += 1 if has_bottom_neighbors and @fields[bottom][left]
    end
    sum += 1 if has_top_neighbors and @fields[top][j]
    sum += 1 if has_bottom_neighbors and @fields[bottom][j]

    if right < @fields[0].count
      sum += 1 if has_top_neighbors and @fields[top][right]
      sum += 1 if @fields[i][right]
      sum += 1 if has_bottom_neighbors and @fields[bottom][right]
    end
    sum
  end

  def fields
    @fields
  end

  private


  def new_state(old_state, n_alive_neighbors)
    return old_state if n_alive_neighbors == 2
    return true if n_alive_neighbors == 3
    false
  end
end
