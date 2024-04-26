class Game
  def initialize(fields)
    @grid = fields
  end

  def tick
    @new_grid = @grid.map(&:dup)

    @grid.each_with_index do |_row, x|
      @grid.each_with_index do |cell, y|
        neighbors = get_neighbors(x, y)

        was_alive = cell

        is_alive = false if was_alive && neighbors < 2
        is_alive = true if was_alive && [2, 3].include?(neighbors)
        is_alive = false if was_alive && neighbors > 3
        is_alive = true if !was_alive && neighbors == 3

        @new_grid[x][y] = is_alive
      end
    end

    @grid = @new_grid
  end

  def fields
    @grid
  end

  private

  def get_neighbors(x, y)
    [[-1, -1], [0, -1], [1, -1], [-1, 0], [1, 0], [-1, 1], [0, 1], [1, 1]].filter_map do |dx, dy|
      @grid.dig(x + dx, y + dy)
    end.length
  end
end
