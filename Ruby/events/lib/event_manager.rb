require "csv"
puts "Events Manager Intialized!"

content= File.readlines "attendees.csv"



content= CSV.open "attendees.csv", headers: true, header_converters: :symbol

content.each do |row|
	
	name = row[:first_name]
	zipcode = row[:zipcode]
	puts "#{name} #{zipcode}"
end
