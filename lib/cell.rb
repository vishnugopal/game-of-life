class Cell
  attr_accessor :alive, :x, :y
  
  def initialize
    self.alive = false
  end
  
  def alive?
    self.alive
  end
  def dead?
    !self.alive
  end
  
  def make_alive
    self.alive = true
  end
  
  def make_dead
    self.alive = false
  end
  
  def evolve(neighbour_count)
    if neighbour_count < 2 or  neighbour_count > 3
      Cell.new.tap do |c|
        c.make_dead
        c.x = self.x
        c.y = self.y
      end
    else
      Cell.new.tap do |c|
        c.make_alive
        c.x = self.x
        c.y = self.y
      end
    end
  end
end