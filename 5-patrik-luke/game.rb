require 'matrix'

class Game
  def initialize(fields)
    @fields = fields
  end

  def tick
    zero_one_array = fields.map { |row| row.map { |cell| cell ? 1 : 0 } }

    m = Matrix[*zero_one_array]

    r = m.clone.to_a
    r << r.shift
    r = Matrix[*r]

    l = m.clone.to_a
    l.unshift l.pop
    l = Matrix[*l]

    u = m.clone.to_a
    u.map { |row| row << row.shift }
    u = Matrix[*u]

    d = m.clone.to_a
    d.map { |row| row.unshift row.pop }
    d = Matrix[*d]

    ru = m.clone.to_a
    ru << ru.shift
    ru.map { |row| row << row.shift }
    ru = Matrix[*ru]

    lu = m.clone.to_a
    lu.unshift lu.pop
    lu.map { |row| row << row.shift }
    lu = Matrix[*lu]

    rd = m.clone.to_a
    rd << rd.shift
    rd.map { |row| row.unshift row.pop }
    rd = Matrix[*rd]

    ld = m.clone.to_a
    ld.unshift ld.pop
    ld.map { |row| row.unshift row.pop }
    ld = Matrix[*ld]

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
