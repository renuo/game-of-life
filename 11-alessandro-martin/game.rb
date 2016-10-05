class Cell
  attr_accessor :row, :col, :current_alive, :next_alive, :neighbors

  def initialize(row, col, alive)
    self.row = row
    self.col = col
    self.current_alive = alive
    self.next_alive = alive
  end

  def next_step
    self.current_alive = next_alive
    self.next_alive = neighbors_alive == 3 || (neighbors_alive == 2 && current_alive)
  end

  def neighbors_alive
    neighbors.select { |neighbor| neighbor.current_alive }.count
  end
end

class Board
  attr_accessor :cells, :row_count, :col_count

  def initialize(fields)
    @cells = []
    self.row_count = fields.count
    self.col_count = fields[0].count
    fields.each_with_index do |row, i|
      row.each_with_index do |col, j|
        @cells.push(Cell.new(i, j, col))
      end
    end
    @cells.each do |cell|
      cell.neighbors = build_neighbors(cell.row, cell.col)
    end
  end

  def next_step
    @cells.each { |cell| cell.next_step }
  end

  def build_neighbors(x, y)
    [
      [x - 1, y - 1], [x - 1, y], [x - 1, y + 1], [x, y - 1], [x, y + 1], [x + 1, y - 1], [x + 1, y], [x + 1, y + 1]
    ].map { |c| get_cell(*c) }.compact
  end

  def get_cell(row, col)
    @cells.find { |cell| (cell.row == row) && (cell.col == col) }
  end

  def fields
    Array.new(row_count) { |row| Array.new(col_count) { |col| get_cell(row, col).next_alive }}
  end
end

class Game
  def initialize(fields)
    @board = Board.new(fields)
  end

  def tick
    @board.next_step
  end

  def fields
    @board.fields
  end
end
