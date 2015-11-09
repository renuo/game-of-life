class Game
  attr_accessor :board

  def initialize(board)
    self.board = board
  end

  def tick
    self.board = board.map.with_index do |row, x|
      row.map.with_index do |cell, y|
        alive_neighbours = find_alive_neighbours(x, y)
        (alive_neighbours == 3 or (alive_neighbours > 2 and cell))
      end
    end
  end

  def find_alive_neighbours(x, y)
    z = (x-1..x+1).map do |row|
      (y-1..y+1).map do |cell|
        board[row][cell] unless row == x && cell == y rescue false
      end
    end.flatten.count { |alive| alive }
  end
end
