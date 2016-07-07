
#EDIT DESTINATION FILE PATH
Dir.chdir 'Users/ralphcaprio/Documents/Camera Uploads'


#Find files to bo moved (and deleted) - EDIT FILE TYPE AND SEARCH PATH
file_names = Dir['**/*.{JPG,jpg}']
puts 'What would you like to call this batch?'
batch_name = gets.chomp

#Displays the findings
puts
print "Downloading #{file_names.length} files:  "

#Counts and renames the filetures
file_number = 0
file_names.each do |name|
	print '.' # << progress bar

	new_name = if file_number <10
		"#{batch_name}0#{file_number}.jpg" #EDIT FILE TYPE
	else
		"#{batch_name}#{file_number}.jpg" #EDIT FILE TYPE
	end

	if File.exist? new_name
		puts "#{new_name} already exists."
		exit
	else
		File.rename name, new_name #Rename the file
	end

	file_number += 1  #Increment the counter

end

puts
puts "Move Complete"

			