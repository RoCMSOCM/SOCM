class DropGalaxyCitations < ActiveRecord::Migration
  def change
    drop_table :galaxy_citations
  end
end
