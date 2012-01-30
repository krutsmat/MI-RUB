require_relative "../lib/algorithms/dijkstra"
require_relative "../lib/algorithms/floydwarshall"
require_relative "../lib/algorithms/matricesmultiplying"
require_relative "../lib/graphtheory/graph"

class Main
  def Main.run(*args)
    raise ArgumentError if args.size != 1    
    filename = args[0][0]    
    
    graph_matrix = Array.new
    File.open(filename, "r"){|f|
      f.each_line do |line|        
        graph_matrix << line.split(" ").map{|x| x.to_i}        
      end      
    }        
    validate_input(graph_matrix)
    graph = GraphTheory::Graph.new(graph_matrix)
    
    puts "\n\nDijkstra algorithm: "
    d = Algorithms::Dijkstra.new(graph)
    print_matrix d.get_shortest_paths
    
    puts "\n\nFloyd-Warshall algorithm: "
    d = Algorithms::FloydWarshall.new(graph)
    print_matrix d.get_shortest_paths
    
    puts "\n\nMultiplying algorithm: "
    d = Algorithms::MatricesMultiplying.new(graph)
    print_matrix d.get_shortest_paths 
  end
  
  def Main.validate_input(matrix)
    n = matrix.size
    n.times do |i|
      raise ArgumentError if(matrix[i].size != n)
    end
  end
  
  def Main.print_matrix(matrix)
    matrix.each { |line| print line; print "\n" }
    puts "*********************"
  end
  
end

Main.run(ARGV)
