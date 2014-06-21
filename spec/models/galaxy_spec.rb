require 'spec_helper'

describe Galaxy  do
  let!(:galaxy) { FactoryGirl.create(:galaxy) }

  it "has a valid Galaxy factory" do
    galaxy.should be_valid
  end

  it "does not allow nil values" do
    FactoryGirl.build(:galaxy, galaxy_name: nil, galaxy_type: nil, distance: nil, luminosity: nil,
                      scale_length: nil, mass_hydrogen: nil, mass_disk: nil, stars: nil,
                      vcr: nil).should_not be_valid
  end

  it "returns a Galaxy name and TYPE as a string" do
    galaxy.galaxy_name.should == "GALAXY NAME"
    galaxy.galaxy_type.should == "ABC"
  end

  it "returns a Galaxy with attributes as floats" do
    galaxy.distance.should be_kind_of(Float)
    galaxy.luminosity.should be_kind_of(Float)
    galaxy.scale_length.should be_kind_of(Float)
    galaxy.mass_hydrogen.should be_kind_of(Float)
    galaxy.mass_disk.should be_kind_of(Float)
    galaxy.stars.should be_kind_of(Float)
    galaxy.vcr.should be_kind_of(Float)
  end

  # TODO: update specs to include future uniqueness of galaxies
end
