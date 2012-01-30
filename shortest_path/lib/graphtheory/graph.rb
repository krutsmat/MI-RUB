require_relative "node"
require_relative "edge"

module GraphTheory
  class Graph
    attr_reader:n
    attr_reader:nodes
    
    def initialize(dist_matrix)
      @dist = dist_matrix
      @n = dist_matrix.size
      @nodes = Array.new(@n)
      
      @n.times do |i|
        raise ArgumentError if(@dist[i].size != @n)
        node = Node.new(i)
        @n.times do |j|
          node.edges << Edge.new(i, j, get_path(i, j)) if(path_exists(i, j))            
        end
        @nodes[i] = node
      end
    end
    
    def get_path(from, to)
      raise ArgumentError if(from >= @n || to >= @n)
      @dist[from][to]
    end
    
    def path_exists(from, to)
      raise ArgumentError if(from >= @n || to >= @n)
      @dist[from][to] > 0
    end
    
    def distance_matrix
      d = @dist.dup
      d.size.times do |i|
        d.size.times do |j|
          d[i][j] = Float::INFINITY if(d[i][j] == 0 && i!=j)
        end
      end
      d
    end
    
  end  
  
end