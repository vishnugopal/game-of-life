require_relative "grid"

class Presenter
  attr_accessor :grid
  
  def initialize(grid)
    @grid = grid
  end
  
  def iterate
    self.grid = self.grid.evolve
  end
  
  def show
    (0..10).each do |x|
      (0..10).each do |y|
        cell = self.grid.cell_at(x, y)
        if cell && cell.alive?
          print "O"
        else
          print " "
        end
      end
      print "\n"
    end
  end
end

g = Grid.new

(0..10).each do |x|
  (0..10).each do |y|
    c = Cell.new
    coordinate = Coordinate.new(x, y)
    c.coordinate = coordinate
    c.make_alive if x % 2 == 0
    g.cells << c
  end
end

p = Presenter.new(g)

loop do
  p.show
  p.iterate
  sleep(0.5)
end