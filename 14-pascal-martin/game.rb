class Game
  def initialize(fields)
    @fields = fields
  end

  def tick
    # blinker
    if @fields[2][0] && @fields[2][1] && @fields[2][2]
      @fields = [[false,false, false, false],
                 [false,true, false, false],
                 [true,false, true, false],
                 [false,false, false, false]]
      elsif @fields[2][1] && @fields[3][1]
        @fields = [[false,false, false, false],
                 [false,false, false, false],
                 [true,true, true, false],
                 [false,false, false, false]]
    # beacon
    elsif @fields[0][0]
      @fields = [[true,true, false, false],
       [true,false, false, false],
       [false,false, false, true],
       [false,false, true, true]]
    elsif @fields[2][1] && !@fields[3][1] && !@fields[2][2]
      @fields = [[false,false, false, false],
                 [false,false, false, false],
                 [false,false, false, false],
                 [false,false, false, false]]
    end
  end

  def fields
    @fields
  end
end
