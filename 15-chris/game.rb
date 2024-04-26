# GAME_PATH=15-chris/game ruby visualize.rb

class Game
  def initialize(fields)
    @fields = fields
  end

  def fields
    @fields
  end

  def tick
    @fields.each_with_index do |col, x|
      col.each_with_index do |row, y|
        live_neighbors = neighbors(x, y).count true

        # # Exposure/Overcrowding
        if live_neighbors < 2 || live_neighbors > 3
          @fields[x][y] = false
        # Revive
        elsif live_neighbors == 3
          @fields[x][y] = true
        end
      end
    end
  end

  private

  def neighbors(x, y)
    [@fields[x-1]&.[](y+1), @fields[x]&.[](y+1), @fields[x+1]&.[](y+1),
     @fields[x-1]&.[](y  ),                      @fields[x+1]&.[](y  ),
     @fields[x-1]&.[](y-1), @fields[x]&.[](y-1), @fields[x+1]&.[](y-1)]
  end
end
