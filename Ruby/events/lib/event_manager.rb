require "csv"
puts "Events Manager Intialized!"

content= File.readlines "attendees.csv"



content= CSV.open "attendees.csv", headers: true, header_converters: :symbol

content.each do |row|
	
	name = row[:first_name]
	zipcode = row[:zipcode]

	if zipcode.nil?
		zipcode= "00000"
	elsif zipcode.length < 5
		zipcode = zipcode.rjust 5, "0"
	elsif zipcode.length > 5
		zipcode = zipcode[0..4]
	end


	puts "#{name} #{zipcode}"
end
