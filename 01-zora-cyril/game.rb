class Cell
  attr_accessor :x, :y, :alive

  def initialize(x, y, alive)
    self.x = x
    self.y = y
    self.alive = alive
  end

  def alive?
    alive
  end
end

class Game
  def initialize(board)
    tick(board)
  end

  def tick(board)
    new_board = Array.new

    board.each_with_index do |row, x|
      row.each_with_index do |alive, y|
        cell = Cell.new(x, y, alive)

        neighbours = find_neighbours(cell, board)
        cell = cell_tick(cell, neighbours)
        new_board[x][y] = cell.alive
      end
    end

    tick(new_board) # if cells alive
  end

  private

  def find_neighbours(cell, board)
    neighbours = []

    neighbours.add board[cell.x-1][cell.y-1]
    neighbours.add board[cell.x-1][cell.y]
    neighbours.add board[cell.x-1][cell.y+1]

    neighbours.add board[cell.x][cell.y-1]
    neighbours.add board[cell.x][cell.y+1]

    neighbours.add board[cell.x+1][cell.y-1]
    neighbours.add board[cell.x+1][cell.y]
    neighbours.add board[cell.x+1][cell.y+1]

    neighbours
  end

  def cell_tick(cell, neighbours)
    alive_neighbours = neighbours.count { |alive| alive }
    cell.alive = (alive_neighbours == 3 or (cell.alive and alive_neighbours == 2))
    cell
  end
end
