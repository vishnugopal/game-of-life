class Coordinate
  attr_accessor :x, :y
  
  def initialize(x, y)
    @x = x
    @y = y
  end
  
  def self.random
    self.new(0, 0)
  end
  
  def ==(other)
    self.x == other.x && self.y == other.y
  end
  
  def neighbour?(coordinate)
    (coordinate.x - x).abs <= 1 &&
      (coordinate.y - y).abs <= 1 &&
      coordinate != self
  end
end