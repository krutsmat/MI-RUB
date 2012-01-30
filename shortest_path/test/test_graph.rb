require "test/unit"
require_relative "../lib/graphtheory/graph"

class TestGraph < Test::Unit::TestCase
  
  def test_init
    input=[[0,10,5,0,0],
           [0,0,2,1,0],
           [0,3,0,9,2],
           [0,0,0,0,4],
           [7,0,0,6,0]]
     graph = GraphTheory::Graph.new(input)
     assert_equal(graph.nodes.size, 5)
     assert(graph.path_exists(0,1) && graph.path_exists(0,2) && !graph.path_exists(0,3))
     node = graph.nodes[0]
     assert_equal(node.edges.size, 2)
     assert_equal(node.edges[0].weight, 10)
     assert_equal(node.edges[0].to, 1)
     assert_equal(node.edges[0].from, 0)
     assert_equal(node.edges[1].weight, 5)
     assert_equal(node.edges[1].to, 2)
     assert_equal(node.edges[1].from, 0)
     
     assert_raises(ArgumentError){graph.get_path(0,5)}
     assert_raises(ArgumentError){graph.path_exists(1,6)}
  end
  
  def test_empty
    input=[]
    graph = GraphTheory::Graph.new(input)
    assert_equal(graph.nodes.size, 0)
  end
  
  def test_invalid
    input=[[1,2]]    
    assert_raises(ArgumentError){GraphTheory::Graph.new(input)}
  end
  
end
