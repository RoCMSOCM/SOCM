class DropAllTables < ActiveRecord::Migration
  def change
    drop_table :galaxies
    drop_table :velocities
    drop_table :citations
    drop_table :galaxy_citations
    drop_table :admins
  end
end
