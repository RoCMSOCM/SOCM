class Velocity < ActiveRecord::Base
  belongs_to :galaxy

  validates :r, presence: true, numericality: {only_float: true}
  validates :vrot_data, presence: true, numericality: {only_float: true}
  validates :vrot_data_error, presence: true
end
