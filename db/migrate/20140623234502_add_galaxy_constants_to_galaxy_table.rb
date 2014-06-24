class AddGalaxyConstantsToGalaxyTable < ActiveRecord::Migration
  def change
    add_column :galaxies, :n, :float, :null => false
    add_column :galaxies, :r0, :float, :null => false
    add_column :galaxies, :n_g, :float, :null => false
    add_column :galaxies, :r_0, :float, :null => false
    add_column :galaxies, :sigma0, :float, :null => false
  end
end
