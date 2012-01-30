require_relative "algorithm"

module Algorithms
  
  class MatricesMultiplying < Algorithms::Algorithm    
    
    def get_shortest_paths()
      s = graph.distance_matrix
      a = s.dup
      graph.n.times do
        a = multiply(a,s)
      end      
      return a            
    end
    
    private 
    def multiply(m, n)
      out = Array.new(graph.n)
      graph.n.times do |i|
        out[i] = Array.new(graph.n)
        graph.n.times do |j|
          s = Array.new(graph.n)
          graph.n.times do |k|
            s[k] = m[i][k] + n[k][j]
          end          
          out[i][j] = s.min
        end  
      end
      out
    end
          
  end  
end