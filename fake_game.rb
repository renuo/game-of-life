class Game
  def initialize(fields = nil)
    @fields = fields
  end


  def fields
    return @fields if @fields

    x = true
    o = false
    r = lambda { rand < 0.5 }
    [
      [o, x, o, o, r.call, o, o, o, o],
      [x, o, x, x, x, r.call, o, o, o],
      [x, o, x, x, x, o, r.call, o, o],
      [x, r.call, x, x, x, o, o, r.call, x],
      [x, o, x, x, x, o, o, r.call, x],
      [x, o, x, x, x, o, o, r.call, o],
      [x, x, x, x, x, x, x, r.call, x],
      [x, o, x, x, x, o, o, r.call, o],
      [o, o, o, r.call, x, o, o, r.call, o]
    ]
  end

  def tick
    # do nothing, fake game!
  end
end
