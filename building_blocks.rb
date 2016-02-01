# Project 1: Caesar Cipher

=begin
Task:
Implement a caesar cipher that takes in a string and the shift factor
and then outputs the modified string.
=end

def caesar_cipher(input, shift)
	output = ""
	
	input.each_byte do |ascii|
		# Take each character's ASCII code
		if ascii >= 65 && ascii <= 90
			# If character is uppercase letter:
			ascii -= 65 					# Subtract to A=0, Z=25
			ascii = (ascii + shift) % 26 	# Shift with wrapping Z-to-A
			ascii += 65						# Add back to new ASCII code
			output += ascii.chr				# Add ASCII character to output
		elsif ascii >= 97 && ascii <= 122
			# If character is lowercase letter:
			ascii -= 97 					# Subtract to a=0, z=25
			ascii = (ascii + shift) % 26 	# Shift with wrapping z-to-a
			ascii += 97						# Add back to new ASCII code
			output += ascii.chr				# Add ASCII character to output
		else
			output += ascii.chr				# Else just add character to output
		end
	end
	output
end

string = "The quick red fox jumps over the lazy brown dog."
puts caesar_cipher(string, 12)
string = "What a string!"
puts caesar_cipher(string, 5)

# Project 2: Stock Picker

=begin
Task:
Implement a method that takes an array of stock prices, one for each
day, and returns a pair of days representing the best days to buy and
sell.
=end

def stock_picker(prices)
=begin
Set prices[0] as min. Go along prices and compare differences,
recording the maximum price difference as you go. If you reach a new min,
set it as min instead, and continue comparing differences to the maximum.
=end
	min = 0								# Initialize everything to 0
	buy = 0
	sell = 0
	max_diff = 0
	(1...prices.length).each do |i|
		if prices[i] < prices[min]
			# If current price is less than current min:
			min = i						# Set as current min
		end
		diff = prices[i] - prices[min]	# Compare difference to current min
		if diff > max_diff
			# If it's better:
			buy = min					# Record min as day to buy
			sell = i					# Record current day as day to sell
			max_diff = diff				# Record new max difference
		end
	end
	[buy, sell]
end

puts "#{stock_picker([17,3,6,9,15,8,6,1,10])}"
puts "#{stock_picker([3, 8, 9, 2, 3, 5, 16, 1])}"