require 'matrix'

class Matrix
  def neighbours(row, col)
    starting_row = [0, row - 1].max
    rows_taken = (row - 1 < 0) ? 2 : 3
    starting_col = [0, col - 1].max
    cols_taken = (col - 1 < 0) ? 2 : 3
    minor_matrix = minor(starting_row, rows_taken, starting_col, cols_taken)
    minor_matrix.to_a.flatten
  end
end

class Game
  def initialize(fields)
    @fields = Matrix.rows(fields)
  end

  def tick
    @fields = Matrix.build(@fields.row_count, @fields.column_count) do |row, col|
      calculate_value(row, col)
    end
  end

  def calculate_value(row, col)
    previous_cell = @fields[row, col]
    alive_neighbours = calculate_alive_neighbours(row, col)
    return false if (alive_neighbours > 3) || (alive_neighbours < 2)
    return true if alive_neighbours == 3
    previous_cell
  end

  def fields
    @fields.to_a
  end

  private

  def calculate_alive_neighbours(row, col)
    @fields.neighbours(row, col).count { |v| v } - (@fields[row, col] ? 1 : 0)
  end
end
