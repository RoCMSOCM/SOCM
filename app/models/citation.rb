require 'bibtex'
class Citation < ActiveRecord::Base
  # This class will be responsible for storing citation information 
  has_and_belongs_to_many :galaxy
  validates :author_name, presence: true
  validates :bibtex_citation, presence: true
  
end
