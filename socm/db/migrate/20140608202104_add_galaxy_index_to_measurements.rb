class AddGalaxyIndexToMeasurements < ActiveRecord::Migration
  def change
    add_index :measurements, :galaxy_id
  end
end
