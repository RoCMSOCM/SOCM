class AddNotNullToMeasurementColumns < ActiveRecord::Migration
  def change
    change_column :measurements, :r, :float, :null => false
    change_column :measurements, :r_err_min, :float, :null => false
    change_column :measurements, :r_err_max, :float, :null => false
    change_column :measurements, :vrot_data, :float, :null => false
    change_column :measurements, :vrot_data_err_min, :float, :null => false
    change_column :measurements, :vrot_data_err_max, :float, :null => false
  end
end
