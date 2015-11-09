class NeighbourService
  def count(board, x, y)
    ([x - 1, 0].max..[x + 1, board.size - 1].min).map do |row|
      ([y - 1, 0].max..[y + 1, board[x].size - 1].min).map do |cell|
        board[row][cell] unless x == row and y == cell
      end
    end.flatten.count { |alive| alive }
  end
end