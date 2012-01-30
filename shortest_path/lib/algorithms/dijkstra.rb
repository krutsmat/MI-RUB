require_relative "algorithm"
require_relative "../graphtheory/node"

module Algorithms
  
  class Dijkstra < Algorithms::Algorithm    
    
    def get_shortest_paths()
      s = empty_solution
      actual_node = 0
      # from all possible starting points
      graph.n.times do |start|
        visited = Array.new(graph.n)
        actual_node = graph.nodes[start]
        s[start][start] = 0
        visited << actual_node.index
        # go all the way
        (graph.n-1).times do         
          #find next node
          actual_node.edges.each do |edge|
            new_length = s[start][actual_node.index] + graph.get_path(edge.from, edge.to)
            s[start][edge.to] = new_length if(s[start][edge.to] > new_length)
          end          
          actual_node = get_next_node(s[start], visited)
          break if(actual_node == nil)
          visited << actual_node.index           
        end
      end      
      return s
    end    
    
    private 
    def get_next_node(a, visited)
      min = Float::INFINITY
      index = -1
      a.each_with_index do |val, i|
        if(min >= val && !visited.include?(i))
          min = val
          index = i
        end          
      end
      return graph.nodes.find {|n| n.index == index}
    end
        
  end
end