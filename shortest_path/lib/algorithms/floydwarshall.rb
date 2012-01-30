require_relative "algorithm"

module Algorithms
  
  class FloydWarshall< Algorithms::Algorithm    
    
    def get_shortest_paths()
      s = graph.distance_matrix
      graph.n.times do |k|
        graph.n.times do |i|
          graph.n.times do |j|
            if(s[i][j] > s[i][k] + s[k][j])
              s[i][j] = s[i][k] + s[k][j]
            end
          end
        end
      end
      return s            
    end      
  end  
end