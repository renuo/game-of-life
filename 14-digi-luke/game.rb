class Game
  def initialize(fields)
    @fields= fields
  end

  def fields
    @fields
  end

  def neighbors_coordinates(x, y)
    [
      [x-1, y-1], [x-1, y], [x-1, y+1],
      [x, y-1], [x, y+1],
      [x+1, y-1], [x+1, y], [x+1, y+1],
    ]
  end

  def neighbors_alive(x, y)
    neighbors_coordinates(x, y).map do |xx, yy|
      xx < 0 || yy < 0 ? 0 : @fields.fetch(xx, [])[yy]
    end.count(true)
  end
end
