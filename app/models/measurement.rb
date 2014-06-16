class Measurement < ActiveRecord::Base
  belongs_to :galaxy

  validates :r, presence: true
  validates :r_err_min, presence: true
  validates :r_err_max, presence: true
  validates :vrot_data, presence: true
  validates :vrot_data_err_min, presence: true
  validates :vrot_data_err_max, presence: true
end
