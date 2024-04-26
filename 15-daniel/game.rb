class Game
  def initialize(fields)
    @grid = fields
  end

  def tick
    @new_grid = []

    for y in 0..@grid.length do
      next if y == @grid.length

      row = []
      for x in 0..@grid[0].length do
        next if x == @grid[0].length

        neighbors = get_neighbors(x, y)

        was_alive = @grid[y][x]

        will_alive = false if was_alive && neighbors < 2
        will_alive = true if was_alive && [2, 3].include?(neighbors)
        will_alive = false if was_alive && neighbors > 3
        will_alive = true if !was_alive && neighbors == 3

        # will_alive = was_alive

        row[x] = will_alive
      end
      @new_grid << row
    end

    @grid = @new_grid
  end

  def fields
    @grid
  end

  private

  def get_neighbors(x, y)
    neighbors = []

    for xi in -1..1 do
      for yi in -1..1 do
        next if xi == 0 && yi == 0

        cx = x + xi
        cy = y + yi

        next if cx < 0
        next if cy < 0

        next if cy >= @grid.length
        next if cx >= @grid[0].length

        neighbors << @grid[cy][cx]
      end
    end

    neighbors.map { |n| n ? 1 : 0 }.sum
  end
end
