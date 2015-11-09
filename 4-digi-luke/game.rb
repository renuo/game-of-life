require_relative('cell')

class Game
  def initialize(fields)
    @age = 0

    @cells = fields.map do |row|
      row.map do |alive|
        Cell.new(alive)
      end
    end

    set_neigbours
    start_threads
  end

  def start_threads
    @cells.flatten.each &:start_threads
  end

  def tick
    while @cells.flatten.map { |c| !c.is_at_least?(@age) }.any? do
      sleep(0.7)
    end
    @age += 1
  end

  def fields
    @cells.map do |row|
      row.map { |c| c.alive?(@age) }
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
