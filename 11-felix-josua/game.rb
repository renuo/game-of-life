class Gladiator
  def initialize(heart_is_beating)
    @heart_is_beating = heart_is_beating
  end

  def alive?
    @heart_is_beating
  end

  def dead?
    !alive?
  end

  def live!
    @heart_is_beating = true
  end

  def die!
    @heart_is_beating = false
  end
end

class Viewer
  def initialize(optimistic)
    @optimistic = optimistic
  end

  def applause?
    @optimistic
  end
end

class Cesar
  attr_accessor :gladiator, :viewers

  def initialize(gladiator, viewers)
    @gladiator = gladiator
    @viewers = viewers
  end

  def approves?(viewers)
    count = viewers.count { |viewer| viewer.applause? }

    return false if count < 2 || count > 3
    return true if count == 3
    @gladiator.alive?
  end
end

class Tournament
  attr_accessor :cesar, :gladiator, :viewers, :outcome

  def initialize(gladiator, viewers)
    @cesar = Cesar.new(gladiator, viewers)
    @gladiator = gladiator
    @viewers = viewers
  end

  def outcome?
    @gladiator.alive?
  end

  def run!
    if @cesar.approves?(@viewers)
      @gladiator.live!
    else
      @gladiator.die!
    end
  end
end

class Game
  def initialize(fields)
    @tournaments = fields.map.with_index do |row, x|
      row.map.with_index do |cell, y|
        gladiator = Gladiator.new(cell)

        p1 = Viewer.new(fields[x-1][y-1]) rescue nil
        p2 = Viewer.new(fields[x-1][y]) rescue nil
        p3 = Viewer.new(fields[x-1][y+1]) rescue nil
        p4 = Viewer.new(fields[x][y-1]) rescue nil
        p5 = Viewer.new(fields[x][y+1]) rescue nil
        p6 = Viewer.new(fields[x+1][y-1]) rescue nil
        p7 = Viewer.new(fields[x+1][y]) rescue nil
        p8 = Viewer.new(fields[x+1][y+1]) rescue nil

        audience = [p1, p2, p3, p4, p5, p6, p7, p8].compact

        Tournament.new(gladiator, audience)
      end
    end
  end

  def tick
    @tournaments.each do |row|
      row.each do |tournament|
        tournament.run!
      end
    end
  end

  def fields
    @tournaments.map do |row|
      row.map do |tournament|
        tournament.outcome?
      end
    end
  end
end
