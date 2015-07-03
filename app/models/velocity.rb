require 'csv'
class Velocity < ActiveRecord::Base
  belongs_to :galaxy

  validates :r, presence: true, numericality: {only_float: true}
  validates :vrot_data, presence: true, numericality: {only_float: true}
  validates :vrot_data_error, presence: true, numericality: {only_float: true}

  def self.import_csv(file)
    velocities = file.path
    puts velocities

    galaxy_file_name = file.original_filename.gsub('.csv', '')

    galaxy = Galaxy.find_by galaxy_name: galaxy_file_name

    CSV.foreach(velocities) do |row|
      galaxy.velocities.create(:r => row[0], :vrot_data => row[1], :vrot_data_error => row[2])
    end
  end
end
