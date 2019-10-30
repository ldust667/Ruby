puts "Events Manager Intialized!"

content= File.readlines "event_attendees.csv"

content.each do |record|
	puts record
end
