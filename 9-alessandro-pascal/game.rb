class Game
  def initialize(fields)
    @fields = fields
  end

  def tick
    new_fields = @fields.clone

    @fields.each_with_index do |row, row_number|
      row.each_with_index do |cell, column_number|
        new_fields[row_number][column_number] = calculate_new_status(cell, count_alive_neighbours(row_number, column_number))
      end
    end

    @fields = new_fields
  end


  def fields
    @fields
  end

  private

  def count_alive_neighbours(row_number, column_number)
    counter = 0

    [-1, 0, 1].each do |y|
      [-1, 0, 1].each do |x|
        unless (row_number + y) < 0 || (column_number + x) < 0
          counter += 1 if @fields.fetch(row_number + y, []).fetch(column_number + x, false) && !(x == 0 && y == 0)
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
