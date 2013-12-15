require_relative "spec_helper"
require_relative "../lib/grid"

describe Grid do
  it "must contain cells" do
    g = Grid.new
    g.cells = [Cell.new, Cell.new]
  end
  
  it "must be able to find out the alive neighbours of a cell" do
    g = Grid.new
    
    (0..2).each do |x|
      (0..2).each do |y|
        c = Cell.new
        c.x = x
        c.y = y
        c.make_alive
        g.cells << c
      end
    end
    
    g.cells.count.should == 9
    
    c = Cell.new
    c.x = 1
    c.y = 1
    
    g.alive_neighbours(c).should == 8
    
    c = Cell.new
    c.x = 0
    c.y = 0
    
    g.alive_neighbours(c).should == 3
    
    c = Cell.new
    c.x = 0
    c.y = 1
    g.alive_neighbours(c).should == 5
  end
  
  it "should be able to return a cell at a particular position" do
    g = Grid.new
    
    (0..2).each do |x|
      (0..2).each do |y|
        c = Cell.new
        c.x = x
        c.y = y
        c.make_alive
        g.cells << c
      end
    end
    
    c = g.cell_at(0, 0)
    c.should be_a Cell
    c.x.should == 0
    c.y.should == 0
  end
  
  it "must be able to evolve a new iteration of the grid" do
    g = Grid.new
    
    (0..2).each do |x|
      (0..2).each do |y|
        c = Cell.new
        c.x = x
        c.y = y
        c.make_alive
        g.cells << c
      end
    end
    
    g2 = g.evolve
    g2.cell_at(0,0).alive?.should == true
    g2.cell_at(0,1).alive?.should == false
    g2.cell_at(0,2).alive?.should == true
    g2.cell_at(1,0).alive?.should == false
    g2.cell_at(1,1).alive?.should == false
    g2.cell_at(1,2).alive?.should == false
    g2.cell_at(2,0).alive?.should == true
    g2.cell_at(2,1).alive?.should == false
    g2.cell_at(2,2).alive?.should == true
  end
end