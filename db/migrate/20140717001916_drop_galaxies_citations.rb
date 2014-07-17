class DropGalaxiesCitations < ActiveRecord::Migration
  def change
    drop_table :galaxies_citations
  end
end
