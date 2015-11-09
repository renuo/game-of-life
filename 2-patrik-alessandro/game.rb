class Game
  attr_accessor :board

  def initialize(board)
    @board = board
  end

  def tick
    new_board = next_board
    @board = new_board
  end

  def self.test
    board = [[false, false, false],
             [false, false, true],
             [false, true, true]]
    game = Game.new(board)
    game.tick()
    puts game.board
  end

  private

  def next_board
    new_board = @board.clone
    @board.each_with_index do |row, row_i|
      row.each_with_index do |col, col_i|
        new_board[row_i][col_i] = calculate_status(row_i, col_i)
      end
    end
  end

  def calculate_status(row_i, col_i)
    alive = status(row_i, col_i)
    num_alive_neighbours = alive_neighbours(row_i, col_i)
    if alive
      return false if num_alive_neighbours < 2
      return true if [2, 3].include? num_alive_neighbours
    else
      return true if num_alive_neighbours == 3
    end
    false
  end

  def alive_neighbours(row_i, col_i)
    count = 0
    check_top = (row_i - 1 >= 0)
    check_bottom = (row_i + 1 < @board.size - 1)
    check_right = (col_i + 1 < @board[row_i].size - 1)
    check_left = (col_i - 1 >= 0)

    count += 1 if check_top && check_left && @board[row_i-1, col_i-1]
    count += 1 if check_left && @board[row_i, col_i-1]
    count += 1 if check_bottom && check_left && @board[row_i + 1, col_i-1]

    count += 1 if check_top && @board[row_i-1, col_i]
    count += 1 if check_bottom && @board[row_i + 1, col_i]

    count += 1 if check_top && check_right && @board[row_i-1, col_i+1]
    count += 1 if check_right && @board[row_i, col_i+1]
    count += 1 if check_right && check_bottom && @board[row_i + 1, col_i+1]
    count
  end

  def status(row_i, col_i)
    @board[row_i][col_i]
  end
end
