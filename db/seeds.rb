# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

path = "#{Rails.root}/db/velocity_data/MILKY-WAY.csv"

galaxy = Galaxy.find(135)
CSV.foreach(path) do |row|
	galaxy.velocities.create(:r => row[0], :vrot_data => row[1], :vrot_data_error => row[2])
end