require "test/unit"
require_relative "../lib/algorithms/matricesmultiplying"
require_relative "../lib/graphtheory/graph"

class TestMatricesMultiplying < Test::Unit::TestCase
  def setup    
  end
  
  def test_graph_normal
    a = [[0,10,5,0,0],
         [0,0,2,1,0],
         [0,3,0,9,2],
         [0,0,0,0,4],
         [7,0,0,6,0]]
    graph = GraphTheory::Graph.new(a)
    alg = Algorithms::MatricesMultiplying.new(graph)
    
    expected = [[0, 8, 5, 9, 7], [11, 0, 2, 1, 4], [9, 3, 0, 4, 2], [11, 19, 16, 0, 4], [7, 15, 12, 6, 0]]
    assert_equal(expected, alg.get_shortest_paths)
  end
  
  def test_no_edges    
    a = [[0,0,0],[0,0,0],[0,0,0]]
    graph = GraphTheory::Graph.new(a)
    alg = Algorithms::MatricesMultiplying.new(graph)
    
    expected = [[0, Float::INFINITY, Float::INFINITY],[Float::INFINITY, 0, Float::INFINITY],[Float::INFINITY,Float::INFINITY,0]]
    assert_equal(expected, alg.get_shortest_paths)
  end
  
  def test_circular
    a = [[0,1,0],[0,0,1],[1,0,0]]
    graph = GraphTheory::Graph.new(a)
    alg = Algorithms::MatricesMultiplying.new(graph)
    expected = [[0,1,2],[2,0,1],[1,2,0]]
    assert_equal(expected, alg.get_shortest_paths)
  end
  
  def test_disconnected
    a = [[0,1,0,0],[1,0,0,0],[0,0,0,1],[0,0,1,0]]
    graph = GraphTheory::Graph.new(a)
    alg = Algorithms::MatricesMultiplying.new(graph)
    expected = [[0,1,Float::INFINITY,Float::INFINITY],[1,0,Float::INFINITY,Float::INFINITY],
                [Float::INFINITY,Float::INFINITY,0,1],[Float::INFINITY,Float::INFINITY,1,0]]
    assert_equal(expected, alg.get_shortest_paths)
  end
  
  def test_trivial
    a = [[0]]
    graph = GraphTheory::Graph.new(a)
    alg = Algorithms::MatricesMultiplying.new(graph)
    expected = [[0]]
    assert_equal(expected, alg.get_shortest_paths)
  end
  
end
