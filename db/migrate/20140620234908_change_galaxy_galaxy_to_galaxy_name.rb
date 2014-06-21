class ChangeGalaxyGalaxyToGalaxyName < ActiveRecord::Migration
  def change
    rename_column :galaxies, :galaxy, :galaxy_name
  end
end
