class Cell
  attr_accessor neighbours, child

  def initialize
    @neighbours = []
  end

  def live
    @child = LiveCell.new
  end

  def die
    @child = DeadCell.new
  end

  def set_child_neighbours
    neighbours.each { |neighbour| child.neighbours[] = neighbour.child }
  end
end

class LiveCell < Cell
  TOO_MANY_PEOPLE = 4
  TOO_FEW_PEOPLE = 2

  def next_generation
    return die if underpopulation? || overpopulation?
    live
  end

  def overpopulation?
    @neighbours >= TOO_MANY_PEOPLE
  end

  def underpopulation?
    @neighbours <= TOO_FEW_PEOPLE
  end
end

class DeadCell < Cell
  CELLS_NEEDED_FOR_REPRODUCTION = 3

  def next_generation
    return live if reproduce?
    die
  end

  def reproduce?
    @neighbours == CELLS_NEEDED_FOR_REPRODUCTION
  end
end

class Game
  def initialize(fields)
    @cells = fields.each { |row| row.each { |value| value ? LiveCell.new : DeadCell.new } }
  end

  def tick
    @cells.each(&:next_generation)
  end

  def fields
    # return the new fields
  end
end
