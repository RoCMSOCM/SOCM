class AddGalaxyNameToGalaxy < ActiveRecord::Migration
  def change
    add_column :galaxies, :galaxy, :string
  end
end
