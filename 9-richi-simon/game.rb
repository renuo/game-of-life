class Game
  def initialize(fields)
    @fields = fields
  end

  def tick
    results = @fields.clone
    @fields.each_with_index do |row, x|
      row.each_with_index do |cell, y|
        results[x][y] = update_status(cell, count_neighbours(x, y))
      end
    end
    @fields = results
  end

  def count_neighbours(x, y)
    sum = 0
    [x-1, x, x+1].each do |row|
      [y-1, y, y+1].each do |colum|
        sum += fetch_cell(row, colum)
      end
    end
    sum - fetch_cell(x, y)
  end

  def fetch_cell(x, y)
    return 0 if x < 0 or y < 0
    @fields.fetch(x, []).fetch(y, false) ? 1 : 0
  end

  def update_status(current_status, n_alive_neighbours)
    return false if current_status and n_alive_neighbours < 2
    return true if current_status and (n_alive_neighbours == 2 or n_alive_neighbours==3)
    return false if current_status and n_alive_neighbours > 3
    return true if !current_status and n_alive_neighbours == 3
    current_status
  end

  def fields
    @fields
  end
end
