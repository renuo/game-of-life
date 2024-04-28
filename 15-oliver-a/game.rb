class Game
  def initialize(fields)
    @fields = fields
  end

  def tick
    new_fields = @fields.map { |row| row.dup }

    @fields.each_with_index do |row, i|
      row.each_with_index do |col, j|
        alive_neighbours = count_neighbours(i, j)
        if col # alive
          new_fields[i][j] = alive_neighbours == 2 || alive_neighbours == 3 # staying alive
        else
          new_fields[i][j] = alive_neighbours == 3 # back to life
        end
      end
    end

    @fields = new_fields
  end

  def count_neighbours(i, j)
    alive_neighbours = 0
    [-1, 0, 1].each do |di|
      [-1, 0, 1].each do |dj|
        next if di == 0 && dj == 0 # skip the current cell itself

        ni = i + di
        nj = j + dj

        next if ni < 0 || ni >= @fields.size # out of row bounds
        next if nj < 0 || nj >= @fields[ni].size # out of column bounds

        alive_neighbours += 1 if @fields[ni][nj]
      end
    end
    alive_neighbours
  end

  def fields
    @fields
  end
end
