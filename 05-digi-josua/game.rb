require 'matrix'

class Game
  def initialize(initial_fields)
    @fields = initial_fields
  end

  def fields
    @fields
  end

  def tick
    @matrix = Matrix[*@fields]
    @matrix.each_with_index do |item, row, col |
      nine = @matrix.minor(col_range(col), row_range(row))
      sum = nine.count { |e| e }
      sum -= 1 if item
      @fields[row][col] = will_live?(item, sum)
    end
  end

  private

  def will_live?(lives, sum)
    lives ? (2..3).include?(sum) : sum == 3
  end

  def col_range(col)
    ([col-1, 0].max)..([col+1, @matrix.column_count - 1].min)
  end

  def row_range(row)
    ([row-1, 0].max)..([row+1, @matrix.row_count - 1].min)
  end
end
