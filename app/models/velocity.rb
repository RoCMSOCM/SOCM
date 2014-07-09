class Velocity < ActiveRecord::Base
  belongs_to :galaxy

  validates :r, presence: true, numericality: {only_float: true}
  validates :r_err_min, presence: true, numericality: {only_float: true}
  validates :r_err_max, presence: true, numericality: {only_float: true}
  validates :vrot_data, presence: true, numericality: {only_float: true}
  validates :vrot_data_err_min, presence: true, numericality: {only_float: true}
  validates :vrot_data_err_max, presence: true, numericality: {only_float: true}
end
