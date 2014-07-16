class RemoveR0NNgFromGalaxies < ActiveRecord::Migration
  def change
    remove_column :galaxies, :n
    remove_column :galaxies, :n_g
    remove_column :galaxies, :r0
  end
end
