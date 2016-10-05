class Cell
  attr_accessor :alive, :x, :y, :neighbors

  def initialize(x, y, alive)
    self.x = x
    self.y = y
    self.alive = alive
  end

  def neighbors_alive
    neighbors.count { |n| n.alive }
  end
end

class Game
  def initialize(fields)
    @fields = fields
  end

  def tick
    build_cells
    build_neighbors
    new_fields = []
    @cells.each do |cell|
      new_fields[cell.x] ||= []
      new_fields[cell.x][cell.y] = cell.neighbors_alive == 3 || (cell.neighbors_alive == 2 && cell.alive)
    end
    @fields = new_fields
  end

  def fields
    @fields
  end

  private

  def build_cells
    @cells = []
    fields.each_with_index do |x, i|
      x.each_with_index do |y, j|
        @cells.push(Cell.new(i, j, y))
      end
    end
  end

  def build_neighbors
    @cells.each do |cell|
      cell.neighbors = neighbors(cell.x, cell.y)
    end
  end

  def neighbors(x, y)
    [
      [x-1, y-1], [x-1, y], [x-1, y+1], [x, y-1], [x, y+1], [x+1, y-1], [x+1, y], [x+1, y+1]
    ].map { |c| get_cell_at(*c) }.compact
  end

  def get_cell_at(x, y)
    @cells.find { |c| c.x == x && c.y == y }
  end
end
