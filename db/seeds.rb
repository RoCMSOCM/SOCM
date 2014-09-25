# This file is used to load in all of the galaxy and velocity data for an initial load.
# Please use 'rake db:seed', after setting up the database to load in all of the original 
# data used by SOCM.
require 'csv'


paramsPath = "#{Rails.root}/db/latex citations/PARAMS_TABLE.csv"
velocitiesPath = "#{Rails.root}/db/velocity_data/"

velocityFiles = Dir.entries(velocitiesPath)

CSV.foreach(paramsPath) do |row|
	galaxy = Galaxy.new(:galaxy_name => row[0], :galaxy_type => row[1], :distance => row[2].to_f,
	                    :luminosity => row[3].to_f, :scale_length => row[4].to_f, :mass_hydrogen => row[5].to_f, :mass_disk => row[6].to_f)

	galaxy.save!

	velocityFiles.each do |filename|
		if filename.downcase.include? galaxy.galaxy_name.downcase
			CSV.foreach(velocitiesPath + filename) do |row|
				galaxy.velocities.create(:r => row[0], :vrot_data => row[1], :vrot_data_error => row[2])
			end
		end
	end
end
