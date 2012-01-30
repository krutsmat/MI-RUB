module GraphTheory
  class Edge
    attr_accessor:from
    attr_accessor:to
    attr_accessor:weight
  
    def initialize(from, to, weight)
      @from = from
      @to = to
      @weight = weight
    end
  end
end