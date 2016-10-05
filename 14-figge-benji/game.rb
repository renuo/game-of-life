class Game
  def initialize(fields)
    @fields = fields
  end

  def tick
    # do logic
  end

  def fields
    @fields
  end

  def get_neighbours(x, y)
    return [false, false, false] if x == 0 && y == 0
    return [false, false, false, true, false, false, true, false]
  end
  
end
