#require 'bibtex'
class Citation < ActiveRecord::Base
  has_many :galaxy_citations, dependent: :delete_all
  has_many :galaxies, :through => :galaxy_citations, :foreign_key => :galaxy_id

  validates :author, :bibtex, :title, presence: true

  accepts_nested_attributes_for :galaxies
end
