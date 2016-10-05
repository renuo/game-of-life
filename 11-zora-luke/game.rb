require_relative 'fields'
require_relative 'field'
require_relative 'ticker'

class Game
  def initialize(fields)
    @fields = Fields.new(fields)
  end

  def tick
    @fields.each do |field|
      Ticker.new(@fields, field).tick
    end
  end

  def fields
    @fields.to_a
  end
end
