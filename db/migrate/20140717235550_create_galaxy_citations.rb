class CreateGalaxyCitations < ActiveRecord::Migration
  def change
    create_table :galaxy_citations do |t|
      t.integer :galaxy_id
      t.integer :citation_id
      t.timestamps
    end
  end
end
