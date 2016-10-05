class Game
  def initialize(fields)
    @fields = fields
    @x_range = 0..@fields.count-1
    @y_range = 0..@fields[0].count-1
  end

  def tick
    @fields = @fields.map.with_index do |row, i|
      row.map.with_index do |_cell, j|
        new_state(i, j)
      end
    end
  end

  def fields
    @fields
  end

  private

  def new_state(i, j)
    arr = [-1,0,1].map do | x |
      [-1,0,1].map do | y |
        (x==0 && y==0) ? false : @fields[i+x][j+y] if in_range(x+i, y+j)
      end
    end.flatten

    neighbors_count = arr.count{ |state| state }

    return false if neighbors_count < 2 || neighbors_count > 3
    return true if neighbors_count == 3
    @fields[i][j]
  end

  def in_range(x,y)
    [*@x_range].product([*@y_range]).include?([x,y])
  end

end
