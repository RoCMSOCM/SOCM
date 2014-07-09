class RemoveColumnsFromGalaxy < ActiveRecord::Migration
  def change
    remove_column :galaxies, :r_0, :float
    remove_column :galaxies, :sigma0, :float
    remove_column :galaxies, :stars, :float
  end
end
