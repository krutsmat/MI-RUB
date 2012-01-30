require_relative "../lib/squares/square"
require "test/unit"

class TestSquare < Test::Unit::TestCase
  def test_area
    rect = Squares::Square.new(0, 0, 4)
    assert_equal(16, rect.area)
  end
  
  def test_intersect
    #Standard intersection
    rect1 = Squares::Square.new(0, 0, 4)
    rect2 = Squares::Square.new(2, 2, 2)
    res = rect1.area + rect2.area - rect1.intersect_area(rect2)    
    assert_equal(19, res)
    #first rectangle inside second one
    rect1 = Squares::Square.new(0, 0, 1.8234)
    rect2 = Squares::Square.new(0, 0, 4)
    res = rect1.area + rect2.area - rect1.intersect_area(rect2)    
    assert_equal(16, res)
    #no intersection
    rect1 = Squares::Square.new(0, 0, 1)
    rect2 = Squares::Square.new(0, 2, 1)        
    assert_equal(0, rect1.intersect_area(rect2))
  end
  
end
