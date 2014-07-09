require 'spec_helper'

describe GalaxiesController do
  let!(:galaxy) { FactoryGirl.create(:galaxy) }
  let!(:galaxy_post) { FactoryGirl.create(:galaxy_post) }

  describe "GET #index" do
    it "renders the index view" do
      get :index
      expect(response.status).to eq(200)
      response.should render_template :index
    end
  end

  context "GET show" do
    context "with valid ID" do
      before(:each) do
        Galaxy.stub(:find).and_return(galaxy)
        Galaxy.stub(:save).and_return(true)
        #galaxy = FactoryGirl.create
      end

      it "returns a galaxy" do
        Galaxy.should_receive(:find).with(1).and_return(galaxy)
        galaxy = Galaxy.find(1)

        expect(galaxy.id).should_not be_nil
        expect(galaxy.galaxy_name).to eq("GALAXY NAME")
        expect(galaxy.galaxy_type).to eq("LSB")
        expect(galaxy.distance).to eq(2.1)
        expect(galaxy.luminosity).to eq(3.1)
        expect(galaxy.scale_length).to eq(4.1)
        expect(galaxy.mass_hydrogen).to eq(5.1)
        expect(galaxy.mass_disk).to eq(6.1)
        expect(galaxy.stars).to eq(7.1)
        expect(galaxy.n).to eq(9.1)
        expect(galaxy.r0).to eq(10.1)
        expect(galaxy.n_g).to eq(11.1)
      end

      it "assigns the returned galaxy to @galaxy" do
        get :show, id: galaxy
        assigns(:galaxy).should eq(galaxy)
      end

      it 'renders the show view' do
        get :show, id: galaxy
        response.should render_template :show
      end
    end

    context "with invalid ID" do
      it "should return 404" do
        get :show, id: -1
        response.should render_template "errors/404"
      end
    end
  end

  context "POST create" do
    context "with valid params" do
      before(:each) do
        #Galaxy.stub(:save).and_return(true)
        post :create, galaxy: galaxy_post.attributes
      end

      it "creates a new Galaxy" do
        expect(galaxy_post.id).should_not be_nil
        expect(galaxy_post.galaxy_name).to eq("newest galaxy")
        expect(galaxy_post.galaxy_type).to eq("LSB")
        expect(galaxy_post.distance).to eq(2.1)
        expect(galaxy_post.luminosity).to eq(3.1)
        expect(galaxy_post.scale_length).to eq(4.1)
        expect(galaxy_post.mass_hydrogen).to eq(5.1)
        expect(galaxy_post.mass_disk).to eq(6.1)
        expect(galaxy_post.stars).to eq(7.1)
        expect(galaxy_post.n).to eq(9.1)
        expect(galaxy_post.r0).to eq(10.1)
        expect(galaxy_post.n_g).to eq(11.1)
      end

      it "returns 200 when successfully creating a new galaxy" do
        expect(response.status).to eq(200)
      end
    end

    context "with invalid params" do
      before(:each) do
        @invalid_galaxy = FactoryGirl.attributes_for(:invalid_galaxy)
      end

      it "does not save the new contact" do
        expect{
            post :create, galaxy: @invalid_galaxy
        }.to_not change(Galaxy, :count)
      end

      it "renders the new form" do
        post :create, galaxy: @invalid_galaxy
        response.should render_template :new
      end
    end
  end

  context "PUT update/:id" do
    context "with valid attributes" do
      before(:each) do
        Galaxy.stub(:save).and_return(true)
        @attr = { :galaxy_name => "herpderp", :galaxy_type => "LSB",
                                    :distance => 10, :luminosity => 20, :scale_length => 30, :mass_hydrogen => 40,
                                    :mass_disk => 50, :stars => 60, :vcr => 70, :n => 80, :r0 => 90, :n_g => 100,
                                    :r_0 => 110, :sigma0 => 120 }
      end

      it "updates an existing Galaxy and gets a redirect response" do
        put :update, :id => galaxy.id, :galaxy => @attr
        galaxy.reload

        expect(response.status).to eq(302)
      end

      it "updates an existing Galaxy" do
        put :update, :id => galaxy.id, :galaxy => @attr
        galaxy.reload

        expect(galaxy.galaxy_name).to eq("herpderp")
        expect(galaxy.galaxy_type).to eq("LSB")
        expect(galaxy.distance).to eq(10)
        expect(galaxy.luminosity).to eq(20)
        expect(galaxy.scale_length).to eq(30)
        expect(galaxy.mass_hydrogen).to eq(40)
        expect(galaxy.mass_disk).to eq(50)
        expect(galaxy.stars).to eq(60)
        expect(galaxy.n).to eq(80)
        expect(galaxy.r0).to eq(90)
        expect(galaxy.n_g).to eq(100)
      end
    end

    context "with invalid attributes" do
      it "does not update the galaxy attributes" do
        put :update, id: galaxy, galaxy: FactoryGirl.attributes_for(:invalid_galaxy)
        galaxy.reload

        galaxy.galaxy_name.should_not eq(nil)
        galaxy.galaxy_type.should_not eq(nil)
        galaxy.distance.should_not eq("abc")
        galaxy.luminosity.should_not eq("abc")
        galaxy.scale_length.should_not eq("abc")
        galaxy.mass_hydrogen.should_not eq("abc")
        galaxy.mass_disk.should_not eq("abc")
        galaxy.stars.should_not eq("abc")
        galaxy.n.should_not eq("abc")
        galaxy.r0.should_not eq("abc")
        galaxy.n_g.should_not eq("abc")
      end

      it "renders the edit view" do
        put :update, id: galaxy, galaxy: FactoryGirl.attributes_for(:invalid_galaxy)
        response.should render_template :edit
      end
    end
  end

  context "DELETE destroy" do
    it "deletes the contact" do
      expect{
        delete :destroy, id: galaxy
      }.to change(Galaxy, :count).by(-1)
    end

    it "redirects to galaxy#index" do
      delete :destroy, id: galaxy
      response.should redirect_to galaxies_url
    end
  end
end
