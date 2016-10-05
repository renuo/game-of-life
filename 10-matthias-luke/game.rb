require_relative 'board'
require_relative 'neighbours'

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
    Neighbours.new(@board, x, y).alive_count
  end

  def fields
    @board.to_fields
  end
end
