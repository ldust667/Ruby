require "csv"
puts "Events Manager Intialized!"

content= File.readlines "attendees.csv"



content= CSV.open "attendees.csv", headers: true

content.each do |row|
	name = row[2]
	puts name
end
