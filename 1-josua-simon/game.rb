class Game
  attr_accessor :current_state, :next_state

  def initialize(inital_state)
    self.current_state = inital_state
    self.next_state = inital_state.clone
  end

  def tick
    self.current_state.each_index do |x|
      self.current_state[x].each_index do |y|
        self.next_state[x][y] = alive?(x, y)
      end
    end
  end

  def fields
    self.next_state
  end

  private

  def alive?(x, y)
    case active_count_around(x, y)
      when 0, 1
        false
      when 2, 3
        true
      else
        false
    end
  end

  def active_count_around(x, y)
    left = x-1
    top = y-1
    right = x+1
    bottom = y+1

    left = nil if left < 0
    top = nil if top < 0
    right = nil if right >= self.current_state.size
    bottom = nil if bottom >= self.current_state[0].size

    counter = 0
    counter += 1 if self.current_state[left][top] rescue nil
    counter += 1 if self.current_state[x][top] rescue nil
    counter += 1 if self.current_state[right][top] rescue nil
    counter += 1 if self.current_state[right][y] rescue nil
    counter += 1 if self.current_state[right][bottom] rescue nil
    counter += 1 if self.current_state[x][bottom] rescue nil
    counter += 1 if self.current_state[left][bottom] rescue nil
    counter += 1 if self.current_state[left][y] rescue nil
    counter
  end
end
