require 'spec_helper'

describe GalaxiesController do
  let!(:galaxy) { FactoryGirl.create(:galaxy) }

  # describe "GET #index" do
  #   it "responds successfully with an HTTP 200 status code" do
  #     get :index
  #     expect(response).to be_success
  #     expect(response.status).to eq(200)
  #   end
  # end

  context "GET show" do
    context "with valid ID" do
      before(:each) do
        Galaxy.stub(:find).and_return(galaxy)
      end

      it "returns a galaxy" do
        Galaxy.should_receive(:find).with(1).and_return(galaxy)
        galaxy1 = Galaxy.find(1)

        expect(galaxy1.id).should_not be_nil
        expect(galaxy1.galaxy).to eq("GALAXY NAME")
        expect(galaxy1.galaxy_type).to eq("ABC")
        expect(galaxy1.distance).to eq(2)
        expect(galaxy1.luminosity).to eq(3)
        expect(galaxy1.scale_length).to eq(4)
        expect(galaxy1.mass_hydrogen).to eq(5)
        expect(galaxy1.mass_disk).to eq(6)
        expect(galaxy1.stars).to eq(7)
        expect(galaxy1.vcr).to eq(8)
      end

      it 'renders the show view' do
        get :show, id: galaxy
        assigns(:galaxy).should eq(galaxy)
      end
    end
  end

  # context "POST create" do

  # end
end
