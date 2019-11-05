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
		#calling method to access list
		legislators = legislators.officials 

		#store legislature names from list 
		legislator_name= legislators.map(&:name)
		
		#converting to string and comma seperating
		legislators_str = legislator_name.join(", ")
 
		print "#{name} #{zipcode} Your elected Officials: "
		puts "#{legislators_str}"


	rescue
		puts "#{name}, you can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials. There appears to be an issue with the zipcode provided: #{zipcode}"
	end


end
