require 'matrix'

class Game
  def initialize(fields)
    @m = Matrix[*fields].map { |cell| cell ? 1 : 0 }
    @t = (-1..1).map { |s| Matrix.build(fields.size, fields[0].size) { |r, c| r + s == c ? 1 : 0 } }
  end

  def tick
    blurred_matrix = @t.repeated_permutation(2).map { |a, b| a * @m * b }.reduce(:+) - @m * 0.5
    @m = blurred_matrix.map { |cell| (2.25..3.75).include?(cell) ? 1 : 0 }
  end

  def fields
    @m.map { |cell| cell == 1 }.to_a
  end
end
