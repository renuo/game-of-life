class Neighbours
  def initialize(board, x, y)
    @board = board
    @x = x
    @y = y
  end

  def alive_count
    x = @x
    y = @y

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
end
