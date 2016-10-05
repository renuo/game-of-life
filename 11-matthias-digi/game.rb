class Game
  def initialize(fields)
    @rule_evaluator = RuleEvaluator.new
    initialize_cells(fields)
    initialize_neighbors
  end

  def tick
    @cells.flatten.each { |cell| cell.will_live = @rule_evaluator.will_live?(cell) }
    @cells.flatten.each { |cell| cell.next! }
  end

  def fields
    @cells.map do |row|
      row.map do |cell|
        cell.alive?
      end
    end
  end

  private 

  def initialize_cells(fields)
    @cells = fields.map.with_index do |row, row_index|
      row.map.with_index do |cell_value, cell_index|
        Cell.new(cell_value, Coordinate.new(row_index, cell_index))
      end
    end
  end

  def initialize_neighbors
    nf = NeighborFinder.new(@cells)
    @cells.map.with_index do |row, row_index|
      row.map.with_index do |cell, cell_index|
        cell.neighbors = nf.find(Coordinate.new(row_index, cell_index))
      end
    end
  end
end

class Cell
  attr_accessor :alive, :neighbors, :will_live, :coordinates

  def initialize(alive, coordinates)
    @alive = alive
  end

  def alive?
    alive
  end

  def alive_neighbors
    neighbors.count { |neighbor| neighbor.alive? }
  end

  def next!
    @alive = will_live
  end
end

class RuleEvaluator
  def will_live?(cell)
    cell.alive_neighbors >= 3 || (cell.alive_neighbors < 2 && cell.alive?) || cell.alive?
  end
end

class NeighborFinder
  def initialize(cells)
    @cells = cells
  end

  def find(coordinates)
    @cells.flatten.select { |cell| coordinates.neighbor_coordinates.include?(cell.coordinates) }
  end
end

class Coordinate
  attr_accessor :x, :y

  def initialize(x, y)
    return nil if x < 0 || y < 0
    @x = x
    @y = y
  end

  def ==(other)
    return false if other.nil?
    @x == other.x && @y == other.y
  end

  def neighbor_coordinates
    [
      Coordinate.new(x-1, y-1),
      Coordinate.new(x-1, y),
      Coordinate.new(x-1, y+1),
      Coordinate.new(x, y-1),
      Coordinate.new(x, y+1),
      Coordinate.new(x+1, y-1),
      Coordinate.new(x+1, y),
      Coordinate.new(x+1, y+1),
    ].compact
  end
end
