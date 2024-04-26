class Game
  def initialize(fields)
    @written_rows = fields
    @reading_rows = @written_rows.map { |row| row.map { |cell| cell } }
  end

  def tick
    @reading_rows = @written_rows.map { |row| row.map { |cell| cell } }

    @reading_rows.each.with_index do |row, y|
      row.each.with_index do |cell, x|
        if cell
          if alive_neighbor_count(x, y) < 2 || alive_neighbor_count(x, y) > 3
            @written_rows[y][x] = false
          end
        else
          if alive_neighbor_count(x, y) == 3
            @written_rows[y][x] = true
          end
        end
      end
    end
  end

  def fields
    @written_rows
  end

    private

    def alive_neighbor_count(x, y)
      result = []
      result.push(*@reading_rows[y-1][x-1..x+1]) if y != 0
      result.push(@reading_rows[y][x-1]) if x != 0
      result.push(@reading_rows[y][x+1]) if x != @reading_rows[0].length - 1
      result.push(*@reading_rows[y+1][x-1..x+1]) if y != @reading_rows.length - 1
      result.count(true)
    end
end
