class AddStarsToGalaxy < ActiveRecord::Migration
  def change
    add_column :galaxies, :stars, :float
  end
end
