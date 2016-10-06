class Cell
  attr_accessor :neighbours

  def initialize(alive)
    @alive = alive
  end

  def update
    sum = @neighbours.count {|n| n.alive? }
    @new_alive = sum == 3 || (sum == 2 && alive?)
  end

  def set_new_state
    @alive = @new_alive
  end

  def alive?
    @alive
  end
end
