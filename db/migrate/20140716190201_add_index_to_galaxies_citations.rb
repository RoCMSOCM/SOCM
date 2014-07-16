class AddIndexToGalaxiesCitations < ActiveRecord::Migration
  def change
    add_index :galaxies_citations, [:galaxy_id, :citation_id]
  end
end
