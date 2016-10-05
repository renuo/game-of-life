class Game
  def initialize(fields)
    @field_length = fields.count
    @fields = Stringstructure.new(fields)
  end

  def tick
    @fields.tick
  end

  def fields
    # return the new fields
    @fields.to_array
  end
end
