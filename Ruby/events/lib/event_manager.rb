require "csv"
require 'google/apis/civicinfo_v2'

civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
#setting API Key
civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'



def clean_zip(zipcode)
	#combined logic to convert value to string add zeros to the front up to the length of 5 and cut off vallues past 5 characters
	zipcode.to_s.rjust(5,"0")[0..4]	

end




puts "Events Manager Intialized!"


content= CSV.open "attendees.csv", headers: true, header_converters: :symbol

content.each do |row|
	
	name = row[:first_name]
	zipcode = clean_zip(row[:zipcode])

	
	begin
		legislators = civic_info.representative_info_by_address(
				address: zipcode,
				levels: 'country',
				roles: ['legislatorUpperBody', 'legislatorLowerBody' ])
		legislators= legislators.officials 
	rescue
		"You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials"
	end


	puts "#{name} #{zipcode} #{legislators}"
end
