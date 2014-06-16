class AddRemainingAttributesToGalaxy < ActiveRecord::Migration
  def change
    add_column :galaxies, :type, :string, :null => false
    add_column :galaxies, :distance, :float, :null => false
    add_column :galaxies, :luminosity, :float, :null => false
    add_column :galaxies, :scale_length, :float, :null => false
    add_column :galaxies, :mass_hydrogen, :float, :null => false
    add_column :galaxies, :mass_disk, :float, :null => false
    add_column :galaxies, :stars, :float, :null => false
    add_column :galaxies, :vcr, :float, :null => false
  end
end
