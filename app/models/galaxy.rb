class Galaxy < ActiveRecord::Base
  has_many :measurements, dependent: :destroy

  validates :galaxy, presence: true
  validates :galaxy_type, presence: true
  validates :distance, presence: true
  validates :luminosity, presence: true
  validates :scale_length, presence: true
  validates :mass_hydrogen, presence: true
  validates :mass_disk, presence: true
  validates :stars, presence: true
  validates :vcr, presence: true
end
