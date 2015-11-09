class Cell
  attr_accessor x, y, alive
  def initialize(x, y, alive)
    self.x = x
    self.y = y
    self.alive = alive
  end

  def will_be_alive?(amount_alive_neighbours)
    amount_alive_neighbours == 3 || (self.alive and amount_alive_neighbours)
  end

  def alive
    self.alive
  end
end

class Game
  attr_accessor board
  attr_accessor new_board

  def initialize(board)
    self.board = board
    self.new_board = board.clone
  end

  def tick
    board.each_with_index do |row, x |
      row.each_with_index do |alive, y |
        cell = Cell.new(x,y, alive)
        new_board[x][y] = cell.will_be_alive?(find_neighbours(cell))
      end
    end
    new_board

  end

  def find_neighbours(cell)
    counter = 0
    [-1..1].each do |x|
      [-1..1].each do |y|
        if cell.x+x > 0 || cell.y+y > 0 || cell.x+x > board.size || cell.y+y = board[0].size
          neighbour = board[cell.x+x][cell.y+y] unless x != 0 and y != 0
          counter += 1 if neighbour

        end
      end
    end
    counter
  end
end