class RemoveStarsFromGalaxy < ActiveRecord::Migration
  def change
    remove_column :galaxies, :stars, :float
  end
end
