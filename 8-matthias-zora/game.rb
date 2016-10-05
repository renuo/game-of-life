
class Game
  def initialize(initial_fields)
    @fields = initial_fields
  end

  def tick
    @fields.each_with_index do | column, x |
      column.each_with_index do | value, y |
        top = y - 1 < 0 ? nil : y - 1
        bottom = y + 1 > column.size ? nil : y + 1
        left = x - 1 < 0 ? nil : x - 1
        right = x + 1 > @fields.size ? nil : x + 1

        alived_around = 0
        alived_around += 1 if @fields[left][top] rescue nil
        alived_around += 1 if @fields[x][top] rescue nil
        alived_around += 1 if @fields[right][top] rescue nil
        alived_around += 1 if @fields[right][y] rescue nil
        alived_around += 1 if @fields[right][bottom] rescue nil
        alived_around += 1 if @fields[x][bottom] rescue nil
        alived_around += 1 if @fields[left][bottom] rescue nil
        alived_around += 1 if @fields[left][y] rescue nil

        if value
          @fields[x][y] = false unless alived_around == 2 || alived_around == 3
        else
          @fields[x][y] = true if alived_around == 3
        end
      end
    end
  end

  def fields
    @fields
  end
end
