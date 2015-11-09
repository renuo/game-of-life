class Game
  attr_reader :fields, :fields_new

  def initialize(board)
    @fields = board
    @fields_new = deep_clone(board)
    @board_size = board.size
  end

  def tick
    @fields.each_with_index do |row, r|
      row.each_with_index do |cell, c|
        @fields_new[r][c] = new_status r, c
      end
    end
    @fields = @fields_new
    @fields_new = deep_clone(@fields_new)
  end

  private

  def deep_clone(board)
    board.map { |row| row.map { |field| field } }
  end

  def new_status(r, c)
    neighbour_count = get_neighbour_count r, c
    if neighbour_count < 2
      return false
    elsif neighbour_count < 4 && @fields[r][ c]
      return true
    elsif neighbour_count > 3
      return false
    elsif neighbour_count == 3
      return true
    end
  end

  def get_neighbour_count(r, c)
    count = 0
    if r == 0
      left = r
    else
      left = r - 1
    end
    if r == @board_size - 1
      right = @board_size - 1
    else
      right = r + 1
    end
    if c == 0
      above = c
    else
      above = c - 1
    end
    if c == @board_size - 1
      below = @board_size - 1
    else
      below = c + 1
    end
    (left..right).each do |row|
      (above..below).each do |column|
        unless r == row && c == column
          if @fields[row][ column]
            count += 1
          end
        end
      end
    end
    count
  end
end
