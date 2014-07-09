class RemoveColumnsFromVelocities < ActiveRecord::Migration
  def change
    remove_column :velocities, :r_err_min, :float
    remove_column :velocities, :r_err_max, :float
    remove_column :velocities, :vrot_data_err_min, :float
    remove_column :velocities, :vrot_data_err_max, :float
  end
end
