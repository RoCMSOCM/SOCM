#This file imports citations into the database and creates the proper citations from the given list.

#Create the array of citations
require 'bibtex'
require 'csv'

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
      key = citation.key.to_s

      citation_new = Citation.new(:author => author, :journal => journal, :volume => volume, :pages => pages,:year => year, :key => key)
      citation_new.save!
    end
  end

  task :give_galaxies_citations => :environment do 
    CSV.foreach("#{Rails.root}/db/latex citations/citation_matrix.csv") do |row|
      galaxy = row[0]
      velocities_citation = row[1]
      luminosity_citation = row[2]
      scale_length_citation = row[3]
      mass_hydrogen_citation = row[4]
      if galaxy != "galaxy_name"
        galaxyObject = Galaxy.where(:galaxy_name => galaxy).first
        velocities_citation_id = find_citation(velocities_citation)
        luminosity_citation_id = find_citation(luminosity_citation)
        scale_length_citation_id = find_citation(scale_length_citation)
        mass_hydrogen_citation_id = find_citation(mass_hydrogen_citation)
        valHash = {:velocities_citation => velocities_citation_id, :luminosity_citation => luminosity_citation_id, :scale_length_citation => scale_length_citation_id, :mass_hydrogen_citation => mass_hydrogen_citation_id}

        if galaxyObject == nil
        else 
          puts valHash
          galaxyObject.update_attributes(valHash)
          galaxyObject.save!
        end
      end
    end
  end

def find_citation(key)
  retval = -1
  if key == "NA"
    retval = -1 
  elsif key == "ES"
    retval = -2
  else 
    citation = Citation.where(:key => key).first
    if citation
      retval = citation.id
    end
  end
  retval
end
end
