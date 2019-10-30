puts "Events Manager Intialized!"

content= File.readlines "event_attendees.csv"

#index = 0

content.each_with_index do |record,index|
#omitting the first line headers in csv
#next if record == " ,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode\n"
#index = index+1
#next if index == 1	
	next if index == 0
	columns = record.split(",")
	first_name= columns[2]
#delimiting csv file to attain first name of each record
	puts first_name
end
