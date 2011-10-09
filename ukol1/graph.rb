class Vertex	
	attr_reader :id, :neighbours
	
	def initialize(id)
		@id = id
		@neighbours = Array.new()
	end
	
	def to_s
		"#{id}"
	end
end

class Graph	
	attr_reader :vertices, :id
	
	def initialize(id, numOfVertices)
		@id = id
		@vertices = Array.new(numOfVertices)
		Integer(numOfVertices).times do |i|
			@vertices[i] = Vertex.new(i+1)
		end
	end
	
	def add_edges(line)
		edges = line.split(" ")
		v = vertices[Integer(edges[0])-1]
		count = Integer(edges[1])
		count.times do |i|
			v.neighbours << vertices[Integer(edges[i+2])-1]
		end
	end
	
	def print_dfs(start)		
		visited = Array.new
		stack = Array.new		
		stack.push(vertices[Integer(start)-1])
		while stack.size != 0 do			
			v = stack.pop()			
			v.neighbours.reverse.each() do |n|
				if !visited.include? n then stack.push(n) end
			end
			if !visited.include? v then
				print v.id
				if(stack.size > 0) then print " " end
			end
			visited.push(v)
		end
		print "\n"
	end
	
	def print_bfs(start)		
		visited = Array.new
		queue = Array.new		
		queue.push(vertices[Integer(start)-1])
		while !queue.empty? do			
			v = queue.pop()			
			v.neighbours.each() do |n|
				if !visited.include? n and !queue.include? n then queue.unshift(n) end
			end
			if !visited.include? v then
				print v.id
				if(!queue.empty?) then print " " end
			end
			visited.push(v)
		end
		print "\n"
	end	
	
	def to_s
		"graph #{id}"
	end
end

class GraphPrinter
	def initialize(filename)
		f = File.open(filename)
		@input = f.readlines
		f.close
		@it = 0
	end
	
	def print()
		graph_count = Integer(get_line())
		graph_count.times do |i|
			v_count = Integer(get_line())
			g = Graph.new(i+1, v_count)
			v_count.times do
				g.add_edges(get_line())
			end
			puts g
			cmd = get_line()
			while cmd.chomp != "0 0" do
				parms = cmd.split(" ")
				if Integer(parms[1]) == 0 then
					g.print_dfs(parms[0])
				else
					g.print_bfs(parms[0])
				end
				cmd = get_line()
			end
		end		
	end	
	
	private
	
	def get_line()
		out = @input[@it]
		@it += 1		
		return out
	end
	
end

gb = GraphPrinter.new("test.txt")
gb.print()
