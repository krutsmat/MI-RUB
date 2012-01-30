module Squares
  class Square
    attr_accessor:x
    attr_accessor:y
    attr_accessor:side    
    
    def initialize(x, y, side)
      @x = x
      @y = y
      @side = side      
    end
    
    def area()
      return @side*@side
    end
    
    def intersect_area(square)      
      overlap_x = get_overlap(Float(@x-@side/2), Float(@x+@side/2),
       Float(square.x-square.side/2), Float(square.x+square.side/2))
       
      overlap_y = get_overlap(Float(@y-@side/2), Float(@y+@side/2),
       Float(square.y-square.side/2), Float(square.y+square.side/2))
       
      return overlap_x*overlap_y
    end
    
    private
    def get_overlap(a1, a2, b1, b2)
      if((a1 < b1 && a2 > b1) || (a1 > b1 && a1 < b2))
        return ([a2, b2].min - [a1, b1].max).abs
      end
      return 0
    end
    
  end
  
  
end