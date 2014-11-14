require_relative "spec_helper"
require_relative "../lib/cell"

describe Cell do
  let(:c) { Cell.new }
  
  it "should be dead when it starts" do
    c.alive?.should == false
    c.dead?.should == true
  end
  
  it "should come alive" do
    c.make_alive
    c.alive?.should == true
  end
  
  it "should become dead" do
    c.make_dead
    c.alive?.should == false
  end
  
  it "should be able to set its position" do
    c.x = 10
    c.y = 100
    
    c.x.should == 10
    c.y.should == 100
  end
  
  # B3/S23/D  
  it "should evolve to be alive if it has three neighbours" do
    c.evolve(3).alive?.should == true
  end
  
  it "should evolve to still be alive when it has two or three neighbours" do
    [2, 3].each do |neighbour_count| 
      c.evolve(neighbour_count).alive?.should == true
    end
  end
  
  it "should be dead when it has less than 2 or more than 3 neighbours" do
    [0, 1, 4, 5, 6].each do |neighbour_count| 
      c.evolve(neighbour_count).alive?.should == false
    end
  end
  
  it "should maintin the same cell position when evolving" do
    c.x = 10
    c.y = 100
    c2 = c.evolve(3)
    c2.x.should == 10
    c2.y.should == 100
    
    c3 = c.evolve(5)
    c3.x.should == 10
    c3.y.should == 100
  end
end