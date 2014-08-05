require 'spec_helper'

describe VelocitiesController do
  include Devise::TestHelpers

  let!(:galaxy_with_velocities) { FactoryGirl.create(:galaxy_with_velocities) }
  let!(:valid_velocity) { galaxy_with_velocities.velocities.first }

  before (:each) do
    @current_admin = FactoryGirl.create(:admin)
    sign_in @current_admin
  end

  describe "GET #index" do
    it "renders the index view" do
      get :index, { :galaxy_id => galaxy_with_velocities.id }
      expect(response.status).to eq(200)
      response.should render_template :index
    end
  end

  context "GET show" do
    context "with valid ID" do
      before(:each) do
        Velocity.stub(:find).and_return(valid_velocity)
        Velocity.stub(:save).and_return(true)
      end

      it "returns a velocity" do
        Velocity.should_receive(:find).with(1).and_return(valid_velocity)
        velocity = Velocity.find(1)

        expect(velocity.id).should_not be_nil
        expect(velocity.r).to eq(1)
        expect(velocity.vrot_data).to eq(2)
        expect(velocity.vrot_data_error).to eq(3)
      end

      it "assigns the returned velocity to @velocity and renders 'show'" do
        get :show, { :galaxy_id => galaxy_with_velocities.id, :id => valid_velocity.id }
        assigns(:velocity).should eq(valid_velocity)
        response.should render_template :show
      end
    end

    context "with invalid ID" do
      it "should return 404" do
        get :show, { :galaxy_id => galaxy_with_velocities.id, :id => -1 }
        response.should render_template "errors/404"
      end
    end
  end

  context "POST create" do
    context "with valid params" do
      it "creates a new Velocity" do
        velocity_post = FactoryGirl.attributes_for(:velocity_post)
        expect{
            post :create, { :velocity => velocity_post, :galaxy_id => galaxy_with_velocities.id }
        }.to change(Velocity, :count)
      end
    end

    context "with invalid params" do
      before(:each) do
        @invalid_velocity = FactoryGirl.attributes_for(:invalid_velocity)
      end

      it "does not save the new velocity and re-renders 'new' form" do
        expect{
            post :create, { :velocity => @invalid_velocity, :galaxy_id => galaxy_with_velocities.id }
        }.to_not change(Velocity, :count)
        response.should render_template :new
      end
    end
  end

  context "PUT update/:id" do
    context "with valid attributes" do
      it "updates an existing Velocity and gets a redirect response" do
        Velocity.stub(:save).and_return(true)
        @attr = {:r => 1.1, :vrot_data => 1.2,
                  :vrot_data_error => 1.3 }

        put :update, {:galaxy_id => galaxy_with_velocities.id,
                      :id => valid_velocity.id,
                      :velocity => @attr
                    }
        valid_velocity.reload

        expect(valid_velocity.r).to eq(1.1)
        expect(valid_velocity.vrot_data).to eq(1.2)
        expect(valid_velocity.vrot_data_error).to eq(1.3)

        expect(response.status).to eq(302)
      end
    end

    context "with invalid attributes" do
      it "does not update the velocity attributes and re-renders the 'edit' view" do
        invalid_attrs = FactoryGirl.attributes_for(:invalid_velocity)
        put :update, { :galaxy_id => galaxy_with_velocities.id, :id => valid_velocity.id, :velocity => invalid_attrs }
        valid_velocity.reload

        valid_velocity.r.should_not eq(nil)
        valid_velocity.vrot_data.should_not eq(nil)
        valid_velocity.vrot_data_error.should_not eq(nil)

        response.should render_template :edit
      end
    end
  end

  context "DELETE" do
    it "deletes the velocity and redirects to velocity#index" do
      expect{
        delete :destroy, galaxy_id: galaxy_with_velocities.id, id: valid_velocity.id
      }.to change(Velocity, :count).by(-1)
      response.should redirect_to galaxy_path(:id => galaxy_with_velocities.id)
    end
  end
end
