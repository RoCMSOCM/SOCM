class AddRemainingColumnsToVelocities < ActiveRecord::Migration
  def change
    add_column :velocities, :vrot_data_error, :float
  end
end
