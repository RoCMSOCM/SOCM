class CreateGalaxyCitations < ActiveRecord::Migration
  def up
    create_table :galaxy_citations do |t|
      t.integer :galaxy_id
      t.integer :citation_id
      t.timestamps
    end
  end

  def down
    drop_table :galaxy_citations
  end
end
