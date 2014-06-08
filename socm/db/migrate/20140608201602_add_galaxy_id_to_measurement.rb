class AddGalaxyIdToMeasurement < ActiveRecord::Migration
  def change
    add_column :measurements, :galaxy_id, :integer
  end
end
