class Galaxy < ActiveRecord::Base
  @@mass_sun = MASS_OF_SUN
  cattr_reader :mass_sun

  has_many :galaxy_citations
  has_many :citations, :through => :galaxy_citations, :foreign_key => :citations_id
  has_many :velocities, dependent: :destroy

  validates :galaxy_name, :galaxy_type, presence: true
  validates_uniqueness_of :galaxy_name, :message => ": this galaxy already exists"
  validates :mass_hydrogen, :mass_disk, :scale_length,  :luminosity, :distance, presence: true, numericality: {only_float: true}

  before_save :set_stars

  #TODO: check M_disk/Mass_sun with James to set number of stars
  #calculates number of stars based on M/Msun
  def set_stars
    self.stars = self.mass_disk/self.mass_sun
    true
  end
end
