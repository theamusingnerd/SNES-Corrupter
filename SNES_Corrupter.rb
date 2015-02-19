=begin
	Written by Alex Sciortino
	SNES Rom Corruptor
=end

def corruptor(rate, start)
	puts "What is the path to the ROM you would like to corrupt?"
	path = gets.chomp
	#/path/filename.extention
	f = File.open(path, "rb")
	test_array = []
	f.each_byte do |x|
		test_array.push(x)
	end
	array_total = test_array.count
	array_count = start
	while array_count < array_total #If the array_count is higher than the number of entries in the array, it stops modifying it.
		test_array[array_count] = rand(1..255)
		#randomly assignes a new value
		array_count += rate
		#adds to array_count.
	end
	puts "Where would you like to save the corrupted ROM?"
	path_save = gets.chomp
	#Determines where to save the ROM
	open(path_save, "wb") do |f|
		test_array.each do |x|
			f.print "#{x.chr}"
			#Prints the ROM to a file
		end
	end
end
puts "    _=---------------------------=_   "
puts "  ,'   _    SUPER  NINTENDO     _ X'.  "
puts " /    ! !                      (_)   \  "
puts "|   __! !__                 _      _ A|  "
puts "|  !__   __!   .:     .:   (_)    (_) |  "
puts "|     ! !     :'     :'   X    _      |  "
puts " \     !_!    select start     (_)    /  "
puts "  '.       _---------------_ B     .'  "
puts "     -___-                   -___-   "
puts""
puts""
puts "Would you like to change default values? y/n"
default = gets.chomp
if default == "y"
	puts "What is the corruption rate?"
	rate = gets.chomp
	rate = rate.to_i
	puts "What is the start byte?"
	start = gets.chomp
	start = start.to_i
	corruptor(rate, start)
	
elsif default == "n"
	rate = 4100
	start = 0
	corruptor(rate, start)
else
	puts "Error. Please restart program."
end
