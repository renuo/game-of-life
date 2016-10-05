class Cell
  attr_accessor :value, :neighbours

  def initialize(value)
    @value = value
    @neighbours = []
  end

  def n_live_neighbours
    @neighbours.select {|cell| cell.value}.count
  end
end

class Game
  def initialize(fields)
    @row_size = fields[0].length
    @dim = @row_size * fields.length
    @cells = fields.map {|row|
      row.map { |value| Cell.new(value)}
    }.flatten

    @cells.each_with_index { |cell, index| cell.neighbours = neighbour_indexes(index).map{ |i| @cells[i] }}
  end

  def neighbour_indexes(i)
    offsets = [-@row_size-1, -@row_size, -@row_size + 1, -1, +1, @row_size+1, @row_size, @row_size+1]
    offsets.map! { |value| value + i}.delete_if { |value| value < 0 && value >= @dim }
  end

  def tick
    #TODO
  end

  def fields
    @cells.map { |cell| cell.value }.each_slice(@row_size).to_a
  end
end
