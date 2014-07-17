# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

#use this file to upload csvs for now
path = "#{Rails.root}/db/velocity_data/MILKY-WAY.csv"

# galaxy = Galaxy.new(:galaxy_name => "MILKY-WAY", :galaxy_type => "LSB", :distance => 0.0081,
#                     :luminosity => 1.6, :scale_length => 2.1, :mass_hydrogen => 0, :mass_disk => 6.43)
# galaxy.save!

galaxy = Galaxy.find(135)
CSV.foreach(path) do |row|
	galaxy.velocities.create(:r => row[0], :vrot_data => row[1], :vrot_data_error => row[2])
end

# 100.times do |i|
#   galaxy = Galaxy.new(:galaxy_name => "Galaxy #{i}", :galaxy_type => "LSB", :distance => (i - 0.0081),
#                      :luminosity => (i-1.6), :scale_length => (i-2.1), :mass_hydrogen => 0, :mass_disk => (i-6.43))
#   galaxy.save!

# end
