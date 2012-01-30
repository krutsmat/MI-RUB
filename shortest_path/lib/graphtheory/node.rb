module GraphTheory
  class Node
    attr_reader:index
    attr_reader:edges
    
    def initialize(index)
      @index = index 
      @edges = Array.new     
    end    
    
  end
end