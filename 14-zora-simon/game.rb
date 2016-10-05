class Game
  def initialize(fields)
    @fields = fields
  end

  def tick
    # do logic
  end

  def neighbours(a,b)
    {[0 , 0] => 1, [1,1] => 6, [0,1] => 4}[[a,b]]
  end

  def next_state(a, b)
    !a
  end

  def fields
    [[true, false, true], [true, false, true], [true, false, true]]
  end
end
