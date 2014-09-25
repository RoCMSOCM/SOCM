class AddCitationFieldsToGalaxies < ActiveRecord::Migration
  def change
    add_column :galaxies, :velocities_citation, :integer
    add_column :galaxies, :luminosity_citation, :integer
    add_column :galaxies, :scale_length_citation, :integer
    add_column :galaxies, :mass_hydrogen_citation, :integer
  end
end
