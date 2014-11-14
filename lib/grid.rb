require_relative "cell"

class Grid
  attr_accessor :cells
  
  def cells
    @cells ||= []
  end
  
  def alive_neighbours(cell)
    self.cells.select { |current_cell| current_cell.neighbour_of? cell }.
      count(&:alive?)
  end
  
  def cell_at(x, y)
    self.cells.select { |current_cell| current_cell.coordinate.x == x &&
       current_cell.coordinate.y == y }.first
  end
  
  # Create a new grid evolved from the old.
  def evolve
    g = Grid.new
    
    self.cells.each do |cell|
      g.cells << cell.evolve(alive_neighbours(cell))
    end
    
    g
  end
end