# GAME_PATH=15-chris/game ruby visualize.rb

class Game
  def initialize(fields)
    @fields = fields
  end

  def fields
    @fields
  end

  def tick
    prev_fields = @fields.map(&:dup)

    @fields.each_with_index do |col, x|
      col.each_with_index do |row, y|
        live_neighbors = neighbors(x, y, prev_fields).count true

        if live_neighbors == 3
          @fields[x][y] = true
        elsif live_neighbors < 2 || live_neighbors > 3
          @fields[x][y] = false
        end
      end
    end
  end

  private

  def neighbors(x, y, fields)
    [fields[x-1]&.[](y+1), fields[x]&.[](y+1), fields[x+1]&.[](y+1),
     fields[x-1]&.[](y  ),                     fields[x+1]&.[](y  ),
     fields[x-1]&.[](y-1), fields[x]&.[](y-1), fields[x+1]&.[](y-1)]
  end
end

class GameMin
  def initialize(f) = @f=f
  def fields = @f
  def tick = (d=@f.map(&:dup);@f.each_with_index{|c,x|c.each_with_index{|r,y|@f[x][y]=(n=[[-1,1],[0,1],[1,1],[-1,0],[1,0],[-1,-1],[0,-1],[1,-1]].filter_map{|a,b|d.dig(x+a,y+b)}.count)==3||(n==2&&@f[x][y])}})
end
