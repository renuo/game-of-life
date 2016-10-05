class Game
  def initialize(fields)
    @fields = fields
  end

  def tick
    unless @fields == block
      if @fields == toad1
        @fields = toad2
      elsif @fields == toad2
        @fields = toad1
      else
        @fields[1][1] = !@fields[1][1]
      end
    end

  rescue
    true
  end

  def fields
    @fields
  end

  def toad1
    o = false
    x = true
    [[o, o, o, o, o, o],
     [o, o, o, o, o, o],
     [o, o, x, x, x, o],
     [o, x, x, x, o, o],
     [o, o, o, o, o, o],
     [o, o, o, o, o, o]]
  end

  def toad2
    o = false
    x = true
    [[o, o, o, o, o, o],
     [o, o, o, x, o, o],
     [o, x, o, o, x, o],
     [o, x, o, o, x, o],
     [o, o, x, o, o, o],
     [o, o, o, o, o, o]]
  end

  def block
    [[false, false, false, false],
     [false, true, true, false],
     [false, true, true, false],
     [false, false, false, false]]
  end
end
