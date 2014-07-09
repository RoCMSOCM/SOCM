class CreateGalaxiesCitations < ActiveRecord::Migration
  def change
    create_table :galaxies_citations, :id => false do |t|
      t.column :galaxy_id, :integer
      t.column :citation_id, :integer
    end
  end

  def down
    drop_table :galaxies_citations
  end
end
