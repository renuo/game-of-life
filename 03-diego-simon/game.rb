require_relative 'neighbour_service.rb'

class Game
  attr_accessor :board, :service
  
  def initialize(board)
    self.board = board
    self.service = NeighbourService.new
  end
  
  def tick
    self.board = board.map.with_index do |row, x|
      row.map.with_index do |col, y|
        (service.count(board,x,y) == 3 || (self.board[x][y] && service.count(board,x,y))) ? true : false
      end
    end
  end
end
