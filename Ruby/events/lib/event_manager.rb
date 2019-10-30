puts "Events Manager Intialized!"

content= File.readlines "event_attendees.csv"

content.each do |record|
	columns = record.split(",")
	first_name= columns[2]
#delimiting csv file to attain first name of each record
	puts first_name
end
