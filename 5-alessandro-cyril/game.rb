require 'Matrix'
require_relative 'matrix'

class Game

  def initialize(fields)
    @matrix = Matrix.build(fields.size, fields[0].size) do |row, col|
      fields[row][col]
    end
  end

  def fields
    @matrix.to_a
  end

  def tick
    @new_matrix = @matrix.clone
    @matrix.each_with_index do |el, row, col|
      @new_matrix[row,col] = new_status(el, row, col)
    end
  end

  protected

  def new_status(element, row, col)
    alive?(element, @matrix.neighbours(row, col).count { |alive| alive })
  end

  def alive?(el, num_neighbours)
    el ? ([2, 3].include? num_neighbours) : num_neighbours == 3
  end

  def tick_diagonal
    @new_fields = @matrix.clone
    new_diagonal = @matrix.each_with_index(:diagonal).map do |el, row, col|
      new_status(el, row, col)
    end
    @new_fields.off_diagonal = @matrix.map.with_index do |el, row, col|

    end
    @new_fields.diagonal(new_diagonal)
  end
end
