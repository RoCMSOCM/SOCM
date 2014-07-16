class Galaxy < ActiveRecord::Base
  @@mass_sun = MASS_OF_SUN
  cattr_reader :mass_sun

  has_and_belongs_to_many :citations
  has_many :velocities, dependent: :destroy

  validates :galaxy_name, presence: true
  validates_uniqueness_of :galaxy_name, :message => ": this galaxy already exists"
  validates :galaxy_type, presence: true
  validates :distance, presence: true, numericality: {only_float: true}
  validates :luminosity, presence: true, numericality: {only_float: true}
  validates :scale_length, presence: true, numericality: {only_float: true}
  validates :mass_hydrogen, presence: true, numericality: {only_float: true}
  validates :mass_disk, presence: true, numericality: {only_float: true}
  before_save :set_stars

  #TODO: check M_disk/Mass_sun with James to set number of stars
  #calculates number of stars based on M/Msun
  def set_stars
    self.stars = self.mass_disk/self.mass_sun
    true
  end
end
