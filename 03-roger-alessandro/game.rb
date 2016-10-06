class Game
  attr_reader :fields

  def initialize(fields)
    @fields = fields
    @fields_size = fields.size
  end

  def self.test
    board = [[false,true,false],
             [true,false,true],
             [false,false,false]]
    gg = Game.new(board)
  end

  def tick
    next_fields = @fields.map.with_index do |row, row_number|
      row.map.with_index do |cell, column_number|
        alive?(row_number, column_number)
      end
    end
    @fields = next_fields
  end

  def alive?(row_number, column_number)
    neighbours_number = number_of_neighbours(row_number, column_number)
    return true if neighbours_number == 3 or (neighbours_number == 2 and @fields[row_number][column_number])
  end

  def number_of_neighbours(cell_row, cell_column)
    counter = 0
    ([cell_row-1, 0].max .. [cell_row + 1, @fields_size - 1].min).each do |row|
      ([cell_column-1, 0].max .. [cell_column + 1, @fields_size - 1].min).each do |column|
        counter += 1 if @fields[row][column] and not (cell_row == row and cell_column == column)
      end
    end
    counter
  end

end
