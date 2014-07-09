class Galaxy < ActiveRecord::Base
  has_many :measurements, dependent: :destroy

  validates :galaxy_name, presence: true
  validates_uniqueness_of :galaxy_name, :message => ": this galaxy already exists"
  validates :galaxy_type, :inclusion => %w(LSB HSB), presence: true
  validates :distance, presence: true, numericality: {only_float: true}
  validates :luminosity, presence: true, numericality: {only_float: true}
  validates :scale_length, presence: true, numericality: {only_float: true}
  validates :mass_hydrogen, presence: true, numericality: {only_float: true}
  validates :mass_disk, presence: true, numericality: {only_float: true}
  validates :stars, presence: true, numericality: {only_float: true}
  validates :vcr, presence: true, numericality: {only_float: true}
  validates :n, presence: true, numericality: {only_float: true}
  validates :r0, presence: true, numericality: {only_float: true}
  validates :n_g, presence: true, numericality: {only_float: true}
  validates :r_0, presence: true, numericality: {only_float: true}
  validates :sigma0, presence: true, numericality: {only_float: true}
end
