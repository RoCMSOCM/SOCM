class CreateGalaxies < ActiveRecord::Migration
  def up
    create_table :galaxies do |t|
      t.string :galaxy_name
      t.string :galaxy_type
      t.float :distance
      t.float :luminosity
      t.float :scale_length
      t.float :mass_hydrogen
      t.float :mass_disk
      t.timestamps
    end
      change_column :galaxies, :galaxy_name, :string, :null => false
      change_column :galaxies, :galaxy_type, :string, :null => false
      change_column :galaxies, :distance, :float, :null => false
      change_column :galaxies, :luminosity, :float, :null => false
      change_column :galaxies, :scale_length, :float, :null => false
      change_column :galaxies, :mass_hydrogen, :float, :null => false
      change_column :galaxies, :mass_disk, :float, :null => false
  end

  def down
    drop_table :galaxies
  end
end
