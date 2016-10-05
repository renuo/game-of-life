class Game
  def initialize(fields)
    @fields = fields
  end

  def tick
    @fields.each_with_index do |row, val |
      @fields.each_with_index do |col, val |
        handle_cell(row, col, neighbours(row,col))
      end
    end
    # neighbours(0, 0)
  end

  def handle_cell(row, col, neighbours)
    @fields[row][col] = false if neighbours < 2
    @fields[row][col] = true if neighbours == 3
    @fields[row][col] = false if neighbours > 3
  end


  def fields
    @fields
  end

  def neighbours(x, y)
    neighbours = [[x-1, y-1], [x-1, y], [x-1, y+1],
                  [x, y-1], [x, y+1],
                  [x+1, y-1], [x+1, y], [x+1, y+1]]
    # ]
    count = 0
    neighbours = neighbours.each do |neighbour|
      x = neighbour.first
      y = neighbour.last
      if (x >= 0 && y >= 0 && @fields.count-1 >= x && @fields[x].count-1 >= y)
        count = count+1 if  @fields[x][y]
      end
    end
    count
  end

end
