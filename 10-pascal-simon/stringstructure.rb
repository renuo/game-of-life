class Stringstructure
  def initialize(fields_array)
    @size = fields_array.size
    @string = serialize(fields_array)
    puts "Serialized as"
    puts @string

  end

  def serialize(fields_array)
    fields_array.flatten.map do |c|
      c ? 1 : 0
    end.join ''
  end

  def tick


  end

  def neighbours
    @string.m
  end

  def new_status(current_state, neighbours)
    return true if (!current_state && neighbours == 3)
    return false if (neighbours < 2 || neighbours > 3)
    return true if (neighbours == 2 ||neighbours == 3)
    fail "not handled"
  end


  def to_array
    deserialized = @string.scan(/.{#{@size}}/).map do |row|
      row.scan(/./).map do |val|
        val == "1" ? true : false
      end
    end
    puts deserialized
    deserialized
  end
end
