class Game
  attr_accessor :board

  def initialize(board)
    self.board = board
  end

  def tick
    self.board = self.board.map.with_index do |row, x|
      row.map.with_index do |cell, y|
        find_neighbours(x, y) == 3 || (cell && find_neighbours(x, y) == 2)
      end
    end
  end

  def find_neighbours(x, y)
    [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]].map do |coordinate|
      self.board.fetch(x + coordinate.first, []).fetch(y + coordinate.last, nil)
    end.flatten.count { |alive| alive}
  end
end
