class Field
  attr_reader :x, :y, :value

  def initialize(value, x, y)
    @new_state = nil
    @value = value
    @x = x
    @y = y
  end

  def update_state(new_value)
    @new_state = new_value
  end

  def begin_new_state
    @new_state = nil
  end

  def update_to_new_state
    @value = @new_state
  end

  def alive?
    @value
  end
end
