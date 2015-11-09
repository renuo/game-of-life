require 'Matrix'

class Matrix
  def neighbours(row, col)
    [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]].map do |coordinates|
      self[row + coordinates.first, col + coordinates.last]
    end.compact.flatten
  end
end
