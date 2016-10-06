class FieldExtractor
  def initialize(fields)
    @fields = fields
  end

  def extract_cells(x, y)
    ((x-1)..(x+1)).to_a.map do |xx|
      ((y-1)..(y+1)).to_a.map do |yy|
        if xx == x && y == yy
          false
        else
          extract_cell(xx, yy)
        end
      end
    end.flatten
  end

  def extract_cell(x, y)
    @fields.fetch(x, []).fetch(y, false)
  end
end
