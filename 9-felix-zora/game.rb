
class Game
  def initialize(initial_fields)
    @fields = initial_fields
  end

  def tick
    @fields.each_with_index do |row, x |
      row.each_with_index do |value, y |
        if value
          @fields[x][y] = false if cell_dies? count_alive(x, y)
        else
          @fields[x][y] = true if count_alive(x, y) == 3
        end
      end
    end
  end

  def cell_dies? (alive_count)
    alive_count > 3 || alive_count < 2
  end

  def count_alive(x, y)
    counter = 0
    (-1 ... 1).each do |x_index|
      (-1 ... 1).each do |y_index|
        if x_index !=0 || y_index != 0
          counter += 1 if @fields[x + x_index][y + y_index]
        end
      end
    end
    counter
  end

  def fields
    @fields
  end
end
