require 'spec_helper'

describe Velocity do
  let!(:galaxy) { FactoryGirl.create(:galaxy_with_velocities) }

  context "Valid" do
    before(:each) do
      @velocity = galaxy.velocities[0]
    end

    it "passes with all floats" do
      @velocity.should be_valid
    end

    it "belongs to a Galaxy" do
      galaxy.velocities.size.should eq(1)
      galaxy.velocities[0].should eq(@velocity)
    end
  end

  # context "Invalid" do
  #   it "does not allow all nil values" do
  #     FactoryGirl.build(:invalid_velocity).should_not be_valid
  #   end
  # end
end
