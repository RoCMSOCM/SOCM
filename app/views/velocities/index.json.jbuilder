json.array!(@velocities) do |measurement|
  json.extract! velocity, :id, :r, :r_err_min, :r_err_max, :vrot_data, :vrot_data_err_min, :vrot_data_err_max
  json.url velocity_url(velcity, format: :json)
end
