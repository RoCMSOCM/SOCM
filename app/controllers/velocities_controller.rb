class VelocitiesController < ApplicationController
  before_action :set_velocity, only: [:show, :edit, :update, :destroy]

  before_filter :find_galaxy

  # GET /velocities
  # GET /velocities.json
  def index
    @q = Citations.search(params[:q])
    @citations = @q.result(distinct: true).page(params[:page])

    respond_to do |format|
      format.html { render :index }
      format.json { render :json => @citations.to_json(
         :only => [:id, :galaxy_name, :galaxy_type, :distance, :luminosity, :scale_length,
                      :mass_hydrogen, :mass_disk, :stars])
      }
    end
  end

  # GET /velocities/1
  # GET /velocities/1.json
  def show
    @galaxy = Galaxy.find(params[:galaxy_id])
    @velocity = @galaxy.velocities.find(params[:id])

    respond_to do |format|
      format.html { render :show }
      format.json { render :json => @velocity.to_json(
         :only => [:id, :galaxy_id, :r, :vrot_data, :vrot_data_error])
      }
    end
  end

  # GET /velocities/new
  def new
    @velocity = @galaxy.velocities.new
  end

  # GET /velocities/1/edit
  def edit
    @velocity = @galaxy.velocities.find(params[:id])
  end

  # POST /velocities
  # POST /velocities.json
  def create
    @velocity = @galaxy.velocities.new(velocity_params)#velocity.new(velocity_params)

    respond_to do |format|
      if @velocity.save
        format.html { redirect_to @velocity, notice: 'velocity was successfully created.' }
        format.json { render :show, status: :created, location: @velocity }
      else
        format.html { render :new }
        format.json { render json: @velocity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /velocities/1
  # PATCH/PUT /velocities/1.json
  def update
    set_velocity
    respond_to do |format|
      if @velocity.update(velocity_params)
        format.html { redirect_to @velocity, notice: 'velocity was successfully updated.' }
        format.json { render :show, status: :ok, location: @velocity }
      else
        format.html { render :edit }
        format.json { render json: @velocity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /velocities/1
  # DELETE /velocities/1.json
  def destroy
    @velocity.destroy
    respond_to do |format|
      format.html { redirect_to @galaxy, notice: 'velocity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_velocity
      find_galaxy
      @velocities = @galaxy.velocities.find(params[:id]) if params[:id]
      rescue ActiveRecord::RecordNotFound
        render 'errors/404'
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def velocity_params
      params.require(:velocity).permit(:galaxy_id, :r, :vrot_data, :vrot_data_error)
    end

    def find_galaxy
      @galaxy = Galaxy.find(params[:galaxy_id])
    end

    def velocity_url(velocity)
      url_for :controller => "velocities", :action => "show",
          :galaxy_id => velocity.galaxy.id, :id => velocity
    end
end
