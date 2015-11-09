class Game
  attr_accessor :fields

  def initialize(fields)
    @fields = fields
  end

  def tick
    fields.map.with_index do |row, r|
      row.map.with_index do |cell, c|
        neighbours = count_active_neighbours(r, c)
        cell ? neighbours == 2 || neighbours == 3 : neighbours == 3
      end
    end
  end

  def count_active_neighbours(r, c)
    counter = 0

    ([r - 1, 0].max...[fields.size - 1, r + 1].min).each do |row|
      ([c - 1, 0].max...[fields.size[row] - 1, c + 1].min).each do |col|
        counter += 1 if fields[row][col] && !(row == r && col == c)
      end
    end
    counter
  end
end
