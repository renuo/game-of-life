require 'matrix'

class Game
  def initialize(fields)
    @fields = fields
    @shifted_identity_matrix = shifted_identity_matrix
  end

  def shifted_identity_matrix
    Matrix.build(@fields.size, @fields[0].size) do |row, col|
      row + 1 == col ? 1 : 0
    end
  end

  def tick
    zero_one_array = fields.map { |row| row.map { |cell| cell ? 1 : 0 } }

    m = Matrix[*zero_one_array]

    si = @shifted_identity_matrix
    u = si * m
    d = si.transpose * m
    l = m * si.transpose
    r = m * si
    ru = si * r
    lu = si * l
    rd = si.transpose * r
    ld = si.transpose * l

    magic_matrix = (m * 0.5) + l + r + u + d + lu + ld + ru + rd
    @fields = magic_matrix.to_a.map do |row|
      row.map do |cell|
        cell < 3.75 && cell > 2.25
      end
    end
  end

  def fields
    @fields
  end
end
