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

