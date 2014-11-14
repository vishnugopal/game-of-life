require_relative "cell"

class Grid
  attr_accessor :cells
  
  def cells
    @cells ||= []
  end
  
  def alive_neighbours(cell)
    self.cells.count { |each_cell| each_cell.alive_neighbour_of?(cell) }
  end
  
  def cell_at(coordinate)
    self.cells.select { |each_cell| each_cell.coordinate == coordinate }.first
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