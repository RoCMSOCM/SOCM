class RemoveVcrFromGalaxies < ActiveRecord::Migration
  def change
    remove_column :galaxies, :vcr, :float
  end
end
