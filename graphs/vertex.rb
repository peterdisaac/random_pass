# Written by Peter Isaac
# Vertex class

require "set"

class Vertex
	attr_accessor :name, :adjacents

	def initialize(name)
		@name = name
		@adjacents = Set.new
	end

	
end

