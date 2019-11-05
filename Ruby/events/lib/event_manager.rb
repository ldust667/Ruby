require "csv"
require 'google/apis/civicinfo_v2'



def clean_zip(zipcode)
	#combined logic to convert value to string add zeros to the front up to the length of 5 and cut off vallues past 5 characters
	zipcode.to_s.rjust(5,"0")[0..4]	

end



def legislator_zip_prnt(name,zip)
	civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
	#setting API Key
	civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

	begin
		legislators = civic_info.representative_info_by_address(
			address: zip,
                	levels: 'country',
                	roles: ['legislatorUpperBody', 'legislatorLowerBody' ])
                
		#calling method to access list
                legislators = legislators.officials

                #store legislature names from list
                legislator_name= legislators.map(&:name)
	#	puts legislator_name

                #converting to string and comma seperating
                legislator_name.join(", ")

                #print "#{name} #{zipcode} Your elected Officials: "
                #puts "#{legislators_str}"


        rescue
                #if the above fails(most likely due to a zipcode error print an error message and direct the client to a web page | Data should be handled with records beforehand but for the time being it is handled this way
                puts "#{name}, you can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials. There appears to be an issue with the zipcode provided: #{zip}"
        end

end




puts "Events Manager Intialized!"


content= CSV.open "attendees.csv", headers: true, header_converters: :symbol

content.each do |row|
	
	name = row[:first_name]
	zipcode = clean_zip(row[:zipcode])
	if legislators = legislator_zip_prnt(name,zipcode)
		puts "#{name} #{zipcode} #{legislators} "
	end
        #puts "#{legislators}"

		
end
