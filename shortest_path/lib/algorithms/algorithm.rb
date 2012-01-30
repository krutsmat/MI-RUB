module Algorithms
  class Algorithm    
    
    def initialize(graph)
      @graph = graph
    end
    
    protected
    def empty_solution
      out = Array.new(@graph.n)
      @graph.n.times do |i|
        out[i] = Array.new(@graph.n)
        out[i].each_with_index do |val, j|
          out[i][j] = 1.0/0
        end        
      end
      out 
    end
    
    def graph
      @graph
    end
    
  end
end