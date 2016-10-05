class Board
  def initialize(fields)
    @fields = fields
  end

  def transaction
    create_snapshot
    yield
  end

  def [](x, y)
    return false if x < 0 || y < 0
    return false if x >= @snapshot.size || y >= @snapshot[0].size
    @snapshot[x][y]
  end

  def set(x, y, value)
    @fields[x][y] = value
  end

  def to_fields
    @fields
  end

  def each_field
    @fields.each_index do |x|
      @fields[x].each_index do |y|
        yield(x, y, self[x, y])
      end
    end
  end

  private

  def create_snapshot
    @snapshot = @fields.map(&:clone)
  end
end
