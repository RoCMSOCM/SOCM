require 'spec_helper'

describe Galaxy  do
  let!(:galaxy) { FactoryGirl.create(:galaxy_with_velocities) }

  context "Valid" do
    it "has a valid Galaxy factory" do
      galaxy.should be_valid
    end

    it "returns a Galaxy name and TYPE as a string" do
      galaxy.galaxy_name.should == "GALAXY NAME"
      galaxy.galaxy_type.should == "LSB"
      galaxy.galaxy_name.should be_kind_of(String)
      galaxy.galaxy_type.should be_kind_of(String)
    end

    it "returns a Galaxy with attributes as floats" do
      galaxy.distance.should be_kind_of(Float)
      galaxy.luminosity.should be_kind_of(Float)
      galaxy.scale_length.should be_kind_of(Float)
      galaxy.mass_hydrogen.should be_kind_of(Float)
      galaxy.mass_disk.should be_kind_of(Float)
    end

    context "after initialized" do
      it "sets velocities_count" do
        galaxy.velocities_count.should eq(1)
      end

      it "sets vrot_data_last" do
        galaxy.vrot_data_last.should eq(galaxy.velocities.last.vrot_data)
      end

      it "sets r_last" do
        galaxy.r_last.should eq(galaxy.velocities.last.r)
      end

      it "sets citation_ids_array" do
        citation = FactoryGirl.create(:citation)
        galaxy.citations << citation

        galaxy.citations.size.should eq(1)
        galaxy.citation_ids_array[0].should eq(galaxy.citations.first.id)
        galaxy.citation_ids_array.should be_kind_of(Array)
      end
    end
  end

  context "Invalid" do
    it "does not allow all nil values" do
      FactoryGirl.build(:galaxy, galaxy_name: nil, galaxy_type: nil, distance: nil, luminosity: nil,
                        scale_length: nil, mass_hydrogen: nil, mass_disk: nil).should_not be_valid
    end

    it "does not allow a nil galaxy_name" do
      FactoryGirl.build(:galaxy, galaxy_name: nil, galaxy_type: "HSB", distance: 1, luminosity: 2,
                        scale_length: 3, mass_hydrogen: 4, mass_disk: 5).should_not be_valid
    end

    it "does not allow a nil galaxy_type" do
      FactoryGirl.build(:galaxy, galaxy_name: "NAME", galaxy_type: nil, distance: 1, luminosity: 2,
                        scale_length: 3, mass_hydrogen: 4, mass_disk: 5).should_not be_valid
    end

    it "does not allow a nil distance" do
      FactoryGirl.build(:galaxy, galaxy_name: "NAME", galaxy_type: "HSB", distance: nil, luminosity: 2,
                        scale_length: 3, mass_hydrogen: 4, mass_disk: 5).should_not be_valid
    end

    it "does not allow a nil luminosity" do
      FactoryGirl.build(:galaxy, galaxy_name: "NAME", galaxy_type: "HSB", distance: 1, luminosity: nil,
                        scale_length: 3, mass_hydrogen: 4, mass_disk: 5).should_not be_valid
    end

    it "does not allow a nil scale_length" do
      FactoryGirl.build(:galaxy, galaxy_name: "NAME", galaxy_type: "HSB", distance: 1, luminosity: 2,
                        scale_length: nil, mass_hydrogen: 4, mass_disk: 5).should_not be_valid
    end

    it "does not allow a nil mass_hydrogen" do
      FactoryGirl.build(:galaxy, galaxy_name: "NAME", galaxy_type: "HSB", distance: 1, luminosity: 2,
                        scale_length: 3, mass_hydrogen: nil, mass_disk: 5).should_not be_valid
    end

    it "does not allow a nil mass_disk" do
      FactoryGirl.build(:galaxy, galaxy_name: "NAME", galaxy_type: "HSB", distance: 1, luminosity: 2,
                        scale_length: 3, mass_hydrogen: 4, mass_disk: nil).should_not be_valid
    end
  end
end
