#This file imports citations into the database and creates the proper citations from the given list.

#Create the array of citations
require 'bibtex'
desc "Create all of the citations"
namespace :citation_importer do
  task :import_citations => :environment do
    bibtex_citations = BibTeX.open("#{Rails.root}/db/latex citations/citations.bib")
    bibtex_citations.each do |citation|
      author = citation.author.to_s
      volume = citation.volume.to_i
      journal = citation.journal.to_s
      pages = citation.pages.to_i
      year = citation.year.to_i
      note = citation.key.to_s

      citation_new = Citation.new(:author => author, :journal => journal, :volume => volume, :pages => pages,:year => year, :note => note)
      citation_new.save!
    end
  end
end
