require_relative 'field_extractor'

class Game
  def initialize(fields)
    @fields = fields
    @next_fields = nil
  end

  def fields
    @fields
  end

  def tick
    @next_fields = @fields.map { |row| row.map { |field| field } }

    @next_fields.each_with_index do |current, x|
      current.each_index do |y|
        evaluate_next_cell(x, y)
      end
    end

    @fields = @next_fields
    @next_fields = nil
  end

  def evaluate_next_cell(x, y)
    current_cell = @fields[x][y]
    @next_fields[x][y] = next_cell_state(current_cell, x, y)
  end

  def next_cell_state(current_cell, x, y)
    cells_around = extract_cells_around(x, y)
    sum = cells_around.map { |v| v ? 1 : 0 }.reduce(:+)
    alive?(current_cell, sum)
  end

  def alive?(current_cell, sum)
    return true if sum == 3
    return true if current_cell && sum == 2

    false
  end

  # @return [Boolean[]]
  def extract_cells_around(x, y)
    FieldExtractor.new(@fields).extract_cells(x, y)
  end
end
