#! /usr/bin/env rubys

require_relative 'calculator'

=begin
 Written by Peter Isaac
=end


puts "Welcome! Type 1 to enter the Vector Calculator."
enter = gets.chomp.to_i

if enter != 1
	puts "Did you mean to type #{enter}? If not, type 'no', otherwise type 'yes'."
	enter = gets.chomp
	if enter == "no"
		calc = Calculator.new(10)
	else
		puts "Exiting..."
	end
else
	calc = Calculator.new(10)
	calc.vals()
	calc.add(5)
	calc.vals()
end


