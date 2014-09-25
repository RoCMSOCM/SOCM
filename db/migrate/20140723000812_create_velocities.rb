class CreateVelocities < ActiveRecord::Migration
  def up
    create_table :velocities do |t|
      t.float :r
      t.float :vrot_data
      t.integer :galaxy_id
      t.float :vrot_data_error

      t.timestamps
    end
    add_index :velocities, :galaxy_id
    change_column :velocities, :r, :float, :null => false
    change_column :velocities, :vrot_data, :float, :null => false
    change_column :velocities, :galaxy_id, :integer, :null => false
    change_column :velocities, :vrot_data_error, :float, :null => false
  end

  def down
    drop_table :velocities
  end
end
