# encoding: UTF-8
desc "Pull data from google drive"
task :pull_googl_drive_data_to_db => :environment do
	name = "Admin"
	email = "admin@portfolego.com"
	password = "password"
	User.create!( name: name,
							  email: email,
								password: password,
								password_confirmation: password)

	require "rubygems"
	require "google_drive"
	require "uri"

	# Logs in.
	# You can also use OAuth. See document of
	# GoogleDrive.login_with_oauth for details.
	session = GoogleDrive.login('username@gmail.com', "password")
	# Second worksheet of
	# https://docs.google.com/spreadsheet/ccc?key=0At2-tLgag__ndGY2dy1OYnFsNFU5LWQtZkZnX1c2OVE
	ws = session.spreadsheet_by_key("0At2-tLgag__ndGY2dy1OYnFsNFU5LWQtZkZnX1c2OVE").worksheets[1]
	User.all.each do |user|
		# Dumps all row.
		for row in 2..ws.num_rows
			ModelNumber = ws[row, 1]			
			name = ws[row, 2]
			description = ws[row, 2]
			year = ws[row, 4]			
			image = URI.parse(ws[row, 10])
			theme = ws[row, 3]
			puts description
			#puts image
			user.pins.create!(image: image, modelnumber: ModelNumber, theme: theme, :Name => name, year: year, description: description)
		end
	end
end