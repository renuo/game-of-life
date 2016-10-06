class Cell
  attr_accessor :neighbours

  def initialize(alive)
    @alives = [alive]
  end

  def start_threads
    t = Thread.new do
      loop do
        update
        sleep(0.1)
      end
    end
    t.abort_on_exception = true
  end

  def current_age
    @alives.size - 1
  end

  def update
    @neighbours.each { |n| return unless n.is_at_least?(current_age) }

    sum = @neighbours.count { |n| n.alive?(current_age) }
    @alives << (sum == 3 || (sum == 2 && alive?(current_age)))
  end

  def alive?(age)
    @alives.fetch(age)
  end

  def is_at_least?(age)
    current_age >= age
  end
end
