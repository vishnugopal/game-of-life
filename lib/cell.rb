require_relative "coordinate"

class Cell
  attr_accessor :alive, :coordinate
  
  def initialize(options = {})
    self.alive = options.delete(:alive) || false
    self.coordinate = options.delete(:coordinate) || Coordinate.random
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
  
  def evolve_into_new_alive_cell
    Cell.new({
      :alive => true,
      :coordinate => coordinate
    })
  end
  
  def evolve_into_new_dead_cell
    Cell.new({
      :alive => false,
      :coordinate => coordinate
    })
  end
  
  def will_survive?(neighbour_count)
    if alive?
      (neighbour_count == 2 or neighbour_count == 3)
    elsif dead?
      neighbour_count == 3
    end
  end
  
  def neighbour_of?(other)
    coordinate.neighbour?(other.coordinate)
  end
  
  def evolve(neighbour_count)
    if will_survive?(neighbour_count)
      evolve_into_new_alive_cell
    else
      evolve_into_new_dead_cell
    end
  end
end