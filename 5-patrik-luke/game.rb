require 'matrix'

class Game
  def initialize(fields)
    @fields = fields
    @shifted_identity_matrix = shifted_identity_matrix
    @shifted_identity_matrix_t = @shifted_identity_matrix.transpose
  end

  def shifted_identity_matrix
    Matrix.build(@fields.size, @fields[0].size) do |row, col|
      row + 1 == col ? 1 : 0
    end
  end

  def tick
    m = Matrix[*fields].map { |cell| cell ? 1 : 0 }

    si = @shifted_identity_matrix
    sit = @shifted_identity_matrix_t
    u = si * m
    d = sit * m
    l = m * sit
    r = m * si
    ru = si * r
    lu = si * l
    rd = sit * r
    ld = sit * l

    magic_matrix = (m * 0.5) + l + r + u + d + lu + ld + ru + rd
    @fields = magic_matrix.map do |cell|
      cell < 3.75 && cell > 2.25
    end.to_a
  end

  def fields
    @fields
  end
end
