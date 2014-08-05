require 'spec_helper'

describe VelocitiesController do
  include Devise::TestHelpers

  let!(:galaxy_with_velocities) { FactoryGirl.create(:galaxy_with_velocities) }
  let!(:valid_velocity) { FactoryGirl.create(:valid_velocity, :galaxy => galaxy_with_velocities) }

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

  # context "PUT update/:id" do
  #   context "with valid attributes" do
  #     before(:each) do
  #       Velocity.stub(:save).and_return(true)
  #       @attr = {:r => 1.1, :vrot_data => 1.2,
  #                 :vrot_data_error => 1.3 }
  #     end

  #     it "updates an existing Velocity and gets a redirect response" do
  #       put :update, {:galaxy_id => galaxy_with_velocities.id, :id => velocity.id, :velocity => @attr}
  #       velocity.reload

  #       expect(velocity.author).to eq(1.1)
  #       expect(velocity.title).to eq(1.2)
  #       expect(velocity.journal).to eq(1.3)

  #       expect(response.status).to eq(302)
  #     end
  #   end

  #   context "with invalid attributes" do
  #     it "does not update the velocity attributes" do
  #       citation = FactoryGirl.attributes_for(:invalid_velocity)
  #       put :update, { :galaxy_id => galaxy_with_velocities.id, :id => velocity, citation:  citation }
  #       velocity.reload

  #       velocity.should_not be_valid
  #     end

  #     it "renders the edit view when receiving invalid attributes" do
  #       put :update, id: velocity, velocity: FactoryGirl.attributes_for(:invalid_velocity)
  #       response.should render_template :edit
  #     end
  #   end
  # end

  # context "DELETE" do
  #   it "deletes the velocity and redirects to velocity#index" do
  #     galaxy_with_velocities.velocities.reload
  #     expect{
  #       delete :destroy, galaxy_id: galaxy_with_velocities.id, id: velocity
  #     }.to change(Velocity, :count).by(-1)
  #     response.should redirect_to velocities_url
  #   end
  # end
end
