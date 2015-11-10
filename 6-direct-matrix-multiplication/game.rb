require 'matrix'

class Game
  def initialize(fields)
    @matrix = Matrix[*fields].map { |cell| cell ? 1 : 0 }
    @shifted_identity_matrix = shifted_identity_matrix
    @shifted_identity_matrix_t = @shifted_identity_matrix.transpose
  end

  def tick
    m = @matrix

    u = @shifted_identity_matrix * m
    d = @shifted_identity_matrix_t * m
    l = m * @shifted_identity_matrix_t
    r = m * @shifted_identity_matrix
    ru = @shifted_identity_matrix * r
    lu = @shifted_identity_matrix * l
    rd = @shifted_identity_matrix_t * r
    ld = @shifted_identity_matrix_t * l

    blurred_matrix = (m * 0.5) + l + r + u + d + lu + ld + ru + rd
    @matrix = blurred_matrix.map do |cell|
      cell > 2.25 && cell < 3.75 ? 1 : 0
    end
  end

  def fields
    @matrix.map { |cell| cell == 1 }.to_a
  end

  private

  def shifted_identity_matrix
    Matrix.build(@matrix.row_count, @matrix.column_count) do |row, col|
      row + 1 == col ? 1 : 0
    end
  end
end
