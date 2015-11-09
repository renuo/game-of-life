
class Game
  def initialize(initial_fields)
    @fields = initial_fields
    @next_fields = initial_fields.map { |row| row.clone }
  end

  def tick
    col_count = @fields[0].size

    flat_fields = @fields.flatten
    next_flat_fields = @fields.flatten
    sums = []

    flat_fields.each_index do |x|
      sums << [
          flat_fields[x-col_count-1],
          flat_fields[x-col_count],
          flat_fields[x-col_count+1],
          flat_fields[x-1],
          flat_fields[x+1],
          flat_fields[x+col_count-1],
          flat_fields[x+col_count],
          flat_fields[x-col_count+1]
      ].count { |e| e }
    end

    sums.each_with_index do |sum, pos|
      next_flat_fields[pos] = will_live?(@fields[pos], sum)
    end

    @next_fields = next_flat_fields.each_slice(col_count).to_a
    @fields = @next_fields
  end

  def fields
    @next_fields
  end

  private

  def will_live?(alive, sum)
    return true if sum == 3
    return true if alive && sum == 2
    false
  end
end
