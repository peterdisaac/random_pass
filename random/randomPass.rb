#! /usr/bin/env ruby

puts "Welcome! This program will generate a random password for you!"
puts "Enter desired length of password. (Must be 8 or greater)"

size = gets.chomp.to_i
while size < 8
	puts "You entered #{size}, which is less than 8.  Try again."
	size = gets.chomp.to_i
end

def generate_pass(number)
	charset = Array('A'..'Z') + Array('a'..'z') + Array(0..9)
	Array.new(number) { charset.sample }.join
end

puts generate_pass(size)


