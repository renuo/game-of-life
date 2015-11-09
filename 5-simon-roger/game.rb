class Game
  attr_accessor :fields, :fields_i

  def initialize(fields)
    @fields_i = convert_to_i(fields)
    @fields = fields
    @field_size = @fields.size
  end

  def tick
    @fields_i = @fields_i.map.with_index do |row, r|
      row.map.with_index do |cell, c|
        alive?(r,c)
      end
    end
    @fields = convert_to_bool(@fields_i)
  end

  private

  def convert_to_i(fields)
    fields.map do |row|
      row.map do |cell|
        cell ? 1 : 0
      end
    end
  end

  def convert_to_bool(fields)
    fields.map do |row|
      row.map do |cell|
        cell == 1
      end
    end
  end

  def alive?(r, c)
    neighbours_count = neighbours_counter(r,c)
    (neighbours_count == 3 || (neighbours_count == 2 && @fields_i[r][c] == 1)) ? 1 : 0
  end

  def neighbours_counter(r, c)
    counter = 0
    ([r-1, 0].max .. [r + 1, @field_size - 1 ].min).each do |row|
      ([c-1, 0].max .. [c + 1, @field_size - 1 ].min).each do |col|
        counter += @fields_i[row][col]
      end
    end
    counter - @fields_i[r][c]
  end

end
