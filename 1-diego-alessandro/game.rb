class Game
  attr_accessor :board

  def initialize(board)
    @board = board
  end

  def tick
    next_round = (0...(board.size - 1)).map do |x|
      (0...board[x].size - 1).map do |y|
        will_live(x, y)
      end
    end
    @board = next_round
  end

  def self.test

  end

  private

  def neighbor_cells(x, y)
    ([x - 1, 0].max)...([x + 1, board.size - 1].min).map do |nx|
      ([y-1, 0].max)...([y+1, board[nx].size - 1].min).map do |ny|
        [nx, ny] unless nx == x && ny == y
      end
    end
  end

  def neighbors_alive(x, y)
    neighbor_cells(x, y).select do |coordinates|
      board[coordinates.first][coordinates.last]
    end.count
  end

  def alive?(x, y)
    board[x, y]
  end

  def will_live(x, y)
    neighbors_alive = neighbors_alive(x, y)

    if alive?(x, y)
      return false if neighbors_alive < 2
      return true if [2, 3].include? neighbors_alive
    else
      return true if neighbors_alive == 3
    end

    false
  end
end
