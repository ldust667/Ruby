require "csv"


def clean_zip(zipcode)
	#combined logic to convert value to string add zeros to the front up to the length of 5 and cut off vallues past 5 characters
	zipcode.to_s.rjust(5,"0")[0..4]	

end




puts "Events Manager Intialized!"

content= File.readlines "attendees.csv"



content= CSV.open "attendees.csv", headers: true, header_converters: :symbol

content.each do |row|
	
	name = row[:first_name]
	zipcode = clean_zip(row[:zipcode])


	puts "#{name} #{zipcode}"
end
