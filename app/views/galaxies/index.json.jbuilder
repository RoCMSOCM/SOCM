json.array!(@galaxies) do |galaxy|
  json.extract! galaxy, :id
  json.url galaxy_url(galaxy, format: :json)
end
