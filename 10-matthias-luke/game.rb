require_relative 'board'

class Game
  def initialize(fields)
    @board = Board.new(fields)
  end

  def tick
    @board.transaction do
      @board.each_field do |x, y, value|
        @board.set(x, y, calculate_next_state(x, y, value))
      end
    end
  end

  def calculate_next_state(x, y, alive)
    count = count_alive_neighbours(x, y)
    return count == 2 || count == 3 if alive
    count == 3
  end

  def count_alive_neighbours(x, y)
    [
      @board[x-1, y-1],
      @board[x-1, y],
      @board[x-1, y+1],
      @board[x, y-1],
      @board[x, y+1],
      @board[x+1, y-1],
      @board[x+1, y],
      @board[x+1, y+1]
    ].count { |x| x }
  end

  def fields
    @board.to_fields
  end
end
