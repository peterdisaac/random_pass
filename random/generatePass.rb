#! /usr/bin/env ruby

=begin
Written by Peter Isaac
This script is to be used as an aid to create a secure password
It makes no promise to deliver a password that will never be cracked
Please use caution if using this script and never write down the password
that is generated.  
Also, the following tips will help
1. The longer the password, the better
2. Don't put in your birthday, name, address, etc.
3. Don't use children's or pets names, birthdays, etc.
4. Come up with a short phrase that will remind you of your password
   i.e. If my password was "1969ChevyCamaro", my short phrase would be "My 
   dream car"
==========================================================================
=end

# Array of common passwords
common = ["pass", "word", "123", "456", "789", "qwerty", "321", "654", "987", "111", "777", "555", "football", "princess", "passw0rd", "dragon", "flower", "admin", "loveme", "password1", "master", "abc", "letmein", "mustang", "superman", "spiderman", "harley", "hunter", "batman", "test", "sunshine", "starwars", "666", "hello", "Pass", "iloveyou", "welcome", "whatever", "freedom", "monkey"]
	  
puts "Welcome to Password Generator! Please type the number of the menu item wish to use."
puts "Password Generator - Main Menu"
puts "1. Generate random password"
puts "2. Add secuirty to a current password"
input = gets.chomp.to_i

while input < 1 && input > 2
	puts "Invalid item. Please try again."
	input = gets.chomp.to_i
end

numChanges = 0;
if input == 2
	puts "Please enter your password now."
	pass = gets.chomp
	# Check password length.. must be 8 characters or more
	while pass.length < 8
	       puts "Password length is too short, security may be compromised"
       	       puts "Enter a new password"
	       pass = gets.chomp	       
	end

	# Remove white spaces
	pass.gsub!(/\s+/, "")

 	count = 1
	puts "Testing password against known common passwords..."
	while count == 1
		common.each do |n|
			if pass.include? n
				puts "Invalid password. Contains '#{n}'"
				count = 0
				break
			end
		end

		if count == 1 # No common passwords
			puts "Your password has passed the test."
			break	
		else
			count = 1
			puts "Your password did not pass the test."
			puts "Enter a new password"
			pass = gets.chomp
			while pass.length < 8
				puts "Password length is too short, security may be compromised"
				puts "Enter a new password"
				pass = gets.chomp
			end
		end
	end	

	# Check if the password include a, e, s, o
	if pass.include? "a"
		pass.gsub!(/a/, "4")
		numChanges += 1
	end
	if pass.include? "e"
		pass.gsub!(/e/, "3")
		numChanges += 1
	end
	if pass.include? "s"
		pass.gsub!(/s/, "5")
		numChanges += 1
	end
	if pass.include? "o"
		pass.gsub!(/o/, "0")
		numChanges += 1
	end

	# Check that the password has had changes made
	if numChanges <= 2 || pass.length < 20
		pass.gsub!(/..?/, &:capitalize)
	end
elsif input == 1
	puts "Enter the number of characters you wish you password to be."
	num = gets.chomp.to_i
	if num < 8
		puts "You gave a number less then 8."
		puts "The password will now be given the default length of 8."
		num = 8
	end

	puts "A random password will be produced using a combination of upper and lower case letters and numbers."
	puts "If you wish to have symbols included, enter 1 now."
	symbols = gets.chomp.to_i

	def generate_pass(number, flag)
		sym = ['!', '@', '$', '%', '?']		
		charset = Array('A'..'Z') + Array('a'..'z') + Array(0..9)
      
		if flag == 1
			charset = charset + sym
		end
		Array.new(number) { charset.sample }.join
	end

	pass = generate_pass(num, symbols)
end

puts "This is your new password, keep it secure!"
puts ""
puts "#{pass}"
puts ""
