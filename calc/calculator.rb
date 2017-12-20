#! /usr/bin/env ruby

=begin
	 Written by Peter Isaac
=end

class Calculator
	def initialize(size)
		@vector = Array.new(size) {|n| n.to_i }
		@vector.each do |n|
			n = 0
		end
	end

	def size()
		puts @vector.size
	end

	def add(num)
		@vector.each do |n|
			n += num
		end
	end

	def vals()
		@vector.each do |n|
			puts @vector[n]
		end
	end
end

