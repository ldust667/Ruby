puts "Events Manager Intialized!"

content= File.readlines "event_attendees.csv"

content.each do |record|
	columns = record.split(",")
#using P instead of puts to show the values as the arrays they actually are
	p columns
end
