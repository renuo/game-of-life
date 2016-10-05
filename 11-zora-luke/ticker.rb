class Ticker
  def initialize(fields, field)
    @fields = fields
    @field = field
  end

  def tick
    count = neighbours.count { |field| field.alive? }
    @field.update_state(will_become_alive?(count))
  end

  def will_become_alive?(count)
    if @field.alive?
      return count == 2 || count == 3
    else
      return count == 3
    end
  end

  def neighbours
    [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]].map do |xx, yy|
      @fields[@field.x + xx, @field.y + yy]
    end
  end
end
