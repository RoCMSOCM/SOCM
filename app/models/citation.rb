require 'bibtex'
class Citation < ActiveRecord::Base
  # This class will be responsible for storing citation information
  has_and_belongs_to_many :galaxies

  validates :author_name, presence: true
  validates :bibtex, presence: true
  validates :url, presence: true
end
