class RenameMeasurementsToVelocities < ActiveRecord::Migration
  def change
    rename_table :measurements, :velocities
  end
end
