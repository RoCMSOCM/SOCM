#require 'bibtex'
class Citation < ActiveRecord::Base
  has_many :galaxy_citations, dependent: :delete_all
  has_many :galaxies, :through => :galaxy_citations, :foreign_key => :galaxy_id

  validates :author, :title, :journal, :year, presence: true

  before_save :set_bibtex

  accepts_nested_attributes_for :galaxies

  def set_bibtex
    self.bibtex = "@article{#{self.author}+#{self.year}"\
                "author = \"#{self.author}\","\
                "title = \"#{self.title}\","\
                "journal = \"#{self.journal}\","\
                "year = \"#{self.year}\","\
                "volume = \"#{self.volume}\","\
                "number = \"#{self.number}\","\
                "pages = \"#{self.pages}\","\
                "month = \"#{self.month}\","\
                "note = \"#{self.note}\","\
                "key = \"#{self.key}\""\
              "}"
  end
end
