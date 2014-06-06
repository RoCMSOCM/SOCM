class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.float :r
      t.float :r_err_min
      t.float :r_err_max
      t.float :vrot_data
      t.float :vrot_data_err_min
      t.float :vrot_data_err_max

      t.timestamps
    end
  end
end
