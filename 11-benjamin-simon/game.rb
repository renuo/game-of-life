class Cell
  def initialize(state)
    @state = state
  end

  def alive?
    @state
  end

  def kill
    @state = false
  end

  def revive
    @state = true
  end
end

class DeadCell
  def initialize
    @state = false
  end

  def alive?
    @state
  end

  def revive
    @state = true
  end
end

class AliveCell
  def initialize
    @state = true
  end

  def alive?
    @state
  end

  def kill
    @state = false
  end
end

class Board
  attr_accessor :fields

  def initialize(fields)
    @fields = fields.map do |row|
      row.map do |cell|
        Cell.new(cell)
      end
    end
  end

  # [[0 0 0]
  # [0 0 0]
  # [0 0 0]]
  def get(x, y)
    return DeadCell.new if (x < 0 || y < 0)
    @fields.fetch(x, []).fetch(y, DeadCell.new)
  end

  def set(x, y, value)
    @fields[x][y] = value
  end

  def to_array
    @fields.map do |row|
      row.map do |cell|
        cell.alive?
      end
    end
  end
end

class Game
  def initialize(fields)
    @board = Board.new(fields)
  end

  def tick
    # do logic
    @board = @board.fields.map.with_index do |row, x|
      row.map.with_index do |col, y|
        new_state = new_state(@board.get(x, y), neighbours(x, y))
        @board.set(x, y, new_state)
      end
    end
  end

  def new_state(cell, n_neighbours)
    cell.kill if (n_neighbours > 3 || n_neighbours < 2)
    cell.revive if (n_neighbours == 3)
    cell
  end

  def neighbours(x, y)
    [
      [x-1, y-1], [x-1, y], [x-1, y+1],
      [x, y-1], [x, y+1],
      [x+1, y-1], [x+1, y], [x+1, y+1]
    ].count do |neighbour|
      # abstract TODO
      @board.get(neighbour.first, neighbour.last).alive? ? 1 : 0
    end
  end

  def fields
    @board.to_array
  end
end
