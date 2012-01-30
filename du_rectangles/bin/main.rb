require_relative("../lib/squares/square")

class Main
  def Main.run    
     begin
      gt_zero = lambda {|x| return x > 0}
      side1 = get("Zadejte delku hrany prvniho ctverce: ", gt_zero)
      x1 = get("Zadejte x-ovou souradnici stredu prvniho ctverce: ")
      y1 = get("Zadejte x-ovou souradnici stredu prvniho ctverce: ")
      side2 = get("Zadejte delku hrany druheho ctverce: ", gt_zero)
      x2 = get("Zadejte x-ovou souradnici stredu druheho ctverce: ")
      y2 = get("Zadejte x-ovou souradnici stredu druheho ctverce: ")
    rescue ArgumentError
      puts "Spatny vstup."
      return
    end
              
    sq1 = Squares::Square.new(x1,y1,side1)
    sq2 = Squares::Square.new(x2,y2,side2)
    
    overlap = sq1.intersect_area(sq2)
    if(overlap == 0)
      puts "Ctverce se ani nedotykaji."
    else
      area = sq1.area + sq2.area - overlap
      puts "Obsah sjednoceni dvou ctvercu je #{area}."
    end
  end
  
  private
  def Main.get(text, validator = lambda{|x| true})
    print text    
    input = Float(gets.chomp)
    if validator.call(input)
      return input
    else
      raise ArgumentError
    end
    
    return input
  end
  
end

Main.run

