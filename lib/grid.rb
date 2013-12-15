require_relative "cell"

class Grid
  attr_accessor :cells
  
  def cells
    @cells ||= []
  end
  
  def alive_neighbours(cell)
    x = cell.x
    y = cell.y
    
    alive_neighbours_count = 0 

    self.cells.each do |neighbour_cell|     
      ((x - 1)..(x + 1)).each do |neighbour_cell_x|
        ((y - 1)..(y + 1)).each do |neighbour_cell_y|
          if neighbour_cell.x == neighbour_cell_x and 
              neighbour_cell.y == neighbour_cell_y
            next if neighbour_cell.x == x and neighbour_cell.y == y
            alive_neighbours_count += 1 if neighbour_cell.alive?
          end
        end
      end
    end

    alive_neighbours_count
  end
  
  def cell_at(x, y)
    self.cells.each do |cell|
      return cell if cell.x == x and cell.y == y 
    end
    
    return false
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