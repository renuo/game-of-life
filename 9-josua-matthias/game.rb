class Game
  def initialize(fields)
    @fields = fields
  end

  def tick
    @fields.each_with_index do |row, i|
      row.each_index do |j|
        @fields[i][j] = new_state(i, j)
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
        (x==0 && y==0) ? false : @fields[i+x][j+y] rescue false
      end
    end.flatten

    neighbors_count = arr.count{ |state| state }

    return false if neighbors_count < 2
    return false if neighbors_count > 3
    return true if (neighbors_count == 2 || neighbors_count == 3) && @fields[i][j]
    return true if neighbors_count == 3 && !@fields[i][j]
  end


end
