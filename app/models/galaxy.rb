class Galaxy < ActiveRecord::Base
  attr_accessor :citation_ids_array

  has_many :galaxy_citations, dependent: :delete_all
  has_many :citations, :through => :galaxy_citations, :foreign_key => :citations_id
  has_many :velocities, dependent: :destroy

  validates :galaxy_name, :galaxy_type, presence: true
  validates_uniqueness_of :galaxy_name, :message => ": this galaxy already exists"
  validates :mass_hydrogen, :mass_disk, :scale_length,  :luminosity, :distance, presence: true, numericality: {only_float: true}

  accepts_nested_attributes_for :citations

  def set_citation_ids_array
    self.citation_ids_array = self.citations.collect(&:id)
  end
end
