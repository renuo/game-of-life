class Game
  def initialize(fields)
    @fields = fields
  end

  def tick
    @fields = @fields.map.with_index do |row, row_number|
      row.map.with_index do |cell, column_number|
        calculate_new_status(cell, count_alive_neighbours(row_number, column_number))
      end
    end
  end


  def fields
    @fields
  end

  private

  def count_alive_neighbours(row_number, column_number)
    counter = 0

    [-1, 0, 1].each do |row_delta|
      [-1, 0, 1].each do |column_delta|
        if ((row_number + row_delta) >= 0 || (column_number + column_delta) >= 0) && !(column_delta == 0 && row_delta == 0)
          counter += 1 if @fields.fetch(row_number + row_delta, []).fetch(column_number + column_delta, false)
        end
      end
    end

    counter
  end

  def calculate_new_status(cell, alive_neighbours)
    if cell
      return false if alive_neighbours < 2
      return true if [2, 3].include?(alive_neighbours)
      return false if alive_neighbours > 3
    else
      return true if alive_neighbours == 3
    end
    cell
  end
end

