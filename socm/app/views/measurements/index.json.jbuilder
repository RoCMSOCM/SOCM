json.array!(@measurements) do |measurement|
  json.extract! measurement, :id, :r, :r_err_min, :r_err_max, :vrot_data, :vrot_data_err_min, :vrot_data_err_max
  json.url measurement_url(measurement, format: :json)
end
