class Game
  def initialize(fields)
    @fields = fields
  end

  def tick
    @fields.each { |row| row << false } << Array.new(@fields[0].count) { false }

    @fields = @fields[0..-2].map.with_index do |row, row_index|
      row[0..-2].map.with_index do |value, col_index|
        next_status(value, calculate_neighbors(row_index, col_index))
      end
    end
  end

  def next_status(value, neighbors_count)
    (value && (([2,3].include?(neighbors_count)))) || ((!value) && neighbors_count == 3)
  end

  def calculate_neighbors(row_index, col_index)
    [[row_index - 1, col_index - 1], [row_index - 1, col_index], [row_index - 1, col_index + 1],
     [row_index, col_index - 1], [row_index, col_index + 1],
     [row_index + 1, col_index - 1], [row_index + 1, col_index], [row_index + 1, col_index + 1]].count do |coordinates|
      @fields[coordinates[0]][coordinates[1]]
    end
  end

  def fields
    @fields
  end
end
