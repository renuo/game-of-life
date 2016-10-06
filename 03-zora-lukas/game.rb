require_relative('cell')

class Game
  def initialize(fields)
    @cells = fields.map do |row|
      row.map do |alive|
        Cell.new(alive)
      end
    end

    set_neigbours
  end

  def tick
    @cells.each do |c|
      c.each &:update
    end
    @cells.each do |c|
      c.each &:set_new_state
    end
  end

  def fields
    @cells.map do |row|
      row.map &:alive?
    end
  end

  def set_neigbours
    @cells.each_with_index do |row, x|
      row.each_with_index do |cell, y|
        cell.neighbours = neighbours(x, y)
      end
    end
  end

  def neighbours(x, y)
    ((x-1)..(x+1)).map do |xx|
      ((y-1)..(y+1)).map do |yy|
        if yy == y && xx == x
          nil
        else
          @cells.fetch(xx, []).fetch(yy, nil)
        end
      end
    end.flatten.compact
  end
end
