class RemoveR0 < ActiveRecord::Migration
  def change
    remove_column :galaxies, :r0
  end
end
