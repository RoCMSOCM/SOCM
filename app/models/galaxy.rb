class Galaxy < ActiveRecord::Base
  attr_accessor :citation_ids_array, :r_last, :vrot_data_last, :velocities_count, :ref_citations

  has_many :galaxy_citations, dependent: :delete_all
  has_many :citations, :through => :galaxy_citations, :foreign_key => :citations_id
  has_many :velocities, dependent: :destroy

  validates :galaxy_name, :galaxy_type, presence: true
  validates_uniqueness_of :galaxy_name, :message => ": this galaxy already exists"
  validates :mass_hydrogen, :mass_disk, :scale_length,  :luminosity, :distance, presence: true, numericality: {only_float: true}

  accepts_nested_attributes_for :citations

  def citation_ids_array
    self.citation_ids_array = self.citations.collect(&:id)
  end

  def r_last
    self.r_last = self.velocities.last.r if self.velocities.last
  end

  def vrot_data_last
    self.vrot_data_last = self.velocities.last.vrot_data if self.velocities.last
  end

  def velocities_count
    self.velocities_count = self.velocities.count if self.velocities
  end

  def ref_citations
    author_vel_citation = Citation.find_by_id(self.velocities_citation).author if Citation.find_by_id(self.velocities_citation)
    author_lum_citation = Citation.find_by_id(self.luminosity_citation).author if Citation.find_by_id(self.luminosity_citation)
    author_scl_citation = Citation.find_by_id(self.scale_length_citation).author if Citation.find_by_id(self.scale_length_citation)
    author_hyd_citation = Citation.find_by_id(self.mass_hydrogen_citation).author if Citation.find_by_id(self.mass_hydrogen_citation)
    
    ref_citations = { 
      :vel_citation => (author_vel_citation ? author_vel_citation : "NA"),
      :lum_citation => (author_lum_citation ? author_lum_citation : "NA"),
      :scl_citation => (author_scl_citation ? author_scl_citation : "NA"),
      :hyd_citation => (author_hyd_citation ? author_hyd_citation : "NA"),
     }
     ref_citations
  end
end
