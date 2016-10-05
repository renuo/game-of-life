class Game
  def initialize(fields)
    @fields = fields
    @fields_history = Hash.new(0)
  end

  # if a cell was alive for 3 turns in a row and dies, it becomes a zombie cell
  # zombie cell will bite neighbours in every turn
  # if it bites any of them, they become zombies
  # zombies are represented with a different symbol

  def tick
    @fields = @fields.map.with_index do |row, x|
      row.map.with_index do |state, y|
        alive = next_state(state, neighbours(x, y))
        if alive
          @fields_history["#{x}#{y}"] += 1
        else
          @fields_history["#{x}#{y}"] = 0
        end

        if @fields_history["#{x}#{y}"] == 3
          :zombie
        else
          alive
        end
      end
    end

    @fields = @fields.map.with_index do |row, x|
      row.map.with_index do |cell, y|
        if cell == :zombie
          infect_neighbours(x, y)
        end
        cell
      end
    end
  end

  def fields
    @fields
  end

  private

  def infect_neighbours(x, y)
    [
      [x - 1, y - 1], [x - 1, y], [x - 1, y + 1],
      [x, y - 1], [x, y + 1],
      [x + 1, y - 1], [x + 1, y], [x + 1, y + 1],
    ].map { |c| @fields[c.first][c.last] = :zombie }
  end

  def neighbours(x, y)

    [
      [x - 1, y - 1], [x - 1, y], [x - 1, y + 1],
      [x, y - 1], [x, y + 1],
      [x + 1, y - 1], [x + 1, y], [x + 1, y + 1],
    ].map { |c| get_field(*c) }.count { |c| 1 if c }
  end

  def get_field(x, y)
    return false if (x < 0 || y < 0)
    @fields.fetch(x, []).fetch(y, false)
  end

  def next_state(state, neighbours)
    neighbours == 3 || (state && neighbours == 2)
  end
end
