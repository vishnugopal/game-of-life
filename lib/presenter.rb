require_relative "grid"

class Presenter
  COORDINATE_MAX_X = 20
  COORDINATE_MAX_Y = 20
  
  attr_accessor :grid
  
  # Make a presenter with an example grid
  def self.with_example_grid
    grid = Grid.new

    (0..COORDINATE_MAX_X).each do |x|
      (0..COORDINATE_MAX_Y).each do |y|
        c = Cell.new
        coordinate = Coordinate.new(x, y)
        c.coordinate = coordinate
        c.make_alive if x % 3 == 0
        grid.cells << c
      end
    end
    
    new(grid)
  end 
  
  def initialize(grid)
    @grid = grid
  end
  
  def evolve
    self.grid = self.grid.evolve
  end
  
  def show
    (0..COORDINATE_MAX_X).each do |x|
      (0..COORDINATE_MAX_Y).each do |y|
        cell = self.grid.cell_at(Coordinate.new(x, y))
        if cell && cell.alive?
          print "X"
        else
          print " "
        end
      end
      print "\n"
    end
  end
  
  def play
    loop do
      show
      evolve
      sleep(0.5)
    end
  end
end

