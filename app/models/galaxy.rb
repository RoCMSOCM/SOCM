class Galaxy < ActiveRecord::Base
  has_many :measurements, dependent: :destroy

  validates :galaxy_name, presence: true
  validates_uniqueness_of :galaxy_name, :message => ": this galaxy already exists"
  validates :galaxy_type, presence: true
  validates :distance, presence: true
  validates :luminosity, presence: true
  validates :scale_length, presence: true
  validates :mass_hydrogen, presence: true
  validates :mass_disk, presence: true
  validates :stars, presence: true
  validates :vcr, presence: true
  validates :n, presence: true
  validates :r0, presence: true
  validates :n_g, presence: true
  validates :r_0, presence: true
  validates :sigma0, presence: true
end
