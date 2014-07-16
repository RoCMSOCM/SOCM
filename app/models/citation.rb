#require 'bibtex'
class Citation < ActiveRecord::Base
  # This class will be responsible for storing citation information
  has_and_belongs_to_many :galaxies

  validates :author, presence: true
  validates :bibtex, presence: true
  validates :title, presence: true
end
