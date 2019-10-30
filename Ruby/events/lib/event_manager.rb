puts "Events Manager Intialized!"

content= File.readlines "event_attendees.csv"



content.each_with_index do |record,index|
#omitting the first line headers in csv
	next if index == 0
	columns = record.split(",")
	first_name= columns[2]
#delimiting csv file to attain first name of each record
	puts first_name
end
