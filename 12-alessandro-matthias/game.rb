class Game
  def initialize(fields)
    @fields = fields
    @alive_history = Array.new(fields.count) { |row| Array.new(fields[0].count) { |col| 0 } }
  end

  def tick
    @fields = @fields.map.each_with_index do |row, row_index|
      row.map.each_with_index do |cell, column_index|
        @alive_history[row_index][column_index] += 1 if (cell == true)
        next_status = calculate_next(row_index, column_index)
        if @alive_history[row_index][column_index] == 3
          next_status = :zombie
        end
        @alive_history[row_index][column_index] = 0 unless next_status
        next_status
      end
    end
  end

  def calculate_next(row_index, column_index)
    alive_neighbours = count_alive_neighbours(row_index, column_index)
    return false if (alive_neighbours < 2 || alive_neighbours > 3) && !(@fields[row_index][column_index] == :zombie)
    return true if alive_neighbours == 3 && !@fields[row_index][column_index]
    @fields[row_index][column_index]
  end

  def count_alive_neighbours(row, col)
    counter = 0
    top = (row - 1) < 0 ? nil : (row - 1)
    left = (col - 1) < 0 ? nil : (col - 1)
    right = col + 1
    bottom = row + 1
    counter += 1 if ((@fields[top][left] == true) rescue nil)
    counter += 1 if ((@fields[top][col] == true) rescue nil)
    counter += 1 if ((@fields[top][right] == true) rescue nil)

    counter += 1 if ((@fields[row][left] == true) rescue nil)
    counter += 1 if ((@fields[row][right] == true) rescue nil)

    counter += 1 if ((@fields[bottom][left] == true) rescue nil)
    counter += 1 if ((@fields[bottom][col] == true) rescue nil)
    counter += 1 if ((@fields[bottom][right] == true) rescue nil)
    counter
  end

  def fields
    @fields
  end
end
