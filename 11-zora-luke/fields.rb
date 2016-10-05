class Fields
  def initialize(array)
    @fields = array.map.with_index do |column, x|
      column.map.with_index do |value, y|
        Field.new(value, x, y)
      end
    end.flatten
  end

  def [](x, y)
    field = @fields.find { |field| field.x == x || field.y == y }
    return field if field
    Field.new(false, -1, -1)
  end

  def each
    transaction do
      @fields.each do |field|
        yield(field)
      end
    end
  end

  def to_a
    array = []
    @fields.each do |field|
      array[field.x] ||= []
      array[field.x][field.y] = field.value
    end
    array
  end

  def transaction
    begin_transaction
    yield
    end_transaction
  end

  def begin_transaction
    @fields.each(&:begin_new_state)
  end

  def end_transaction
    @fields.each(&:update_to_new_state)
  end
end
