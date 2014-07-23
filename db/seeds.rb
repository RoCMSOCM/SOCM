# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'


paramsPath = "#{Rails.root}/db/PARAMS_TABLE.csv"
velocitiesPath = "#{Rails.root}/db/velocity_data/"

velocityFiles = Dir.entries(velocitiesPath)

CSV.foreach(paramsPath) do |row|
	galaxy = Galaxy.new(:galaxy_name => row[0], :galaxy_type => row[1], :distance => row[2].to_f,
	                    :luminosity => row[3].to_f, :scale_length => row[4].to_f, :mass_hydrogen => row[5].to_f, :mass_disk => row[6].to_f)

	galaxy.save!

	velocityFiles.each do |filename|
		if filename.include? galaxy.galaxy_name
			CSV.foreach(velocitiesPath + filename) do |row|
				galaxy.velocities.create(:r => row[0], :vrot_data => row[1], :vrot_data_error => row[2])
			end
		end
	end
end
