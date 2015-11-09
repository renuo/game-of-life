class Game
  attr_accessor :fields

  def initialize(fields)
    self.fields = fields
  end

  def tick
    self.fields = fields.map.with_index do |row, x|
      row.map.with_index do |cell, y|
        neighbours = get_no_of_active_neighbours(x, y)
        neighbours == 3 || (cell && neighbours == 2)
      end
    end
  end

  def get_no_of_active_neighbours(x, y)
    [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]].map do |coordinates|
      fields[x + coordinates.first, y + coordinates.last] rescue false
    end.flatten.count { |alive| alive }
  end
end
