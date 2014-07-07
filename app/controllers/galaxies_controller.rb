class GalaxiesController < ApplicationController
  before_action :set_galaxy, only: [:show, :edit, :update, :destroy]
  max_per_page = 5

  # GET /galaxies
  # GET /galaxies.json
  def index
    @q = Galaxy.search(params[:q])
    @galaxies = @q.result(distinct: true).page(params[:page])

    respond_to do |format|
      format.html { render :index }
      format.json { render :json => @galaxies.to_json(
         :only => [:id, :galaxy_name, :galaxy_type, :distance, :luminosity, :scale_length,
                      :mass_hydrogen, :mass_disk, :stars, :vcr, :n, :r0, :n_g, :r_0, :sigma0]).page(params[:page])
      }
    end
  end

  # GET /galaxies/1
  # GET /galaxies/1.json
  def show
    @galaxy = Galaxy.find(params[:id].to_i)
    @q = @galaxy.measurements.search(params[:q])
    @measurements = @q.result(distinct: true)

    respond_to do |format|
      format.html { render :show }
      format.json { render :json => @galaxy.to_json(
         :only => [:id, :galaxy_name, :galaxy_type, :distance, :luminosity, :scale_length,
                      :mass_hydrogen, :mass_disk, :stars, :vcr, :n, :r0, :n_g, :r_0, :sigma0])
      }
    end
  end

  # GET /galaxies/new
  def new
    @galaxy = Galaxy.new
  end

  # GET /galaxies/1/edit
  def edit
  end

  # POST /galaxies
  # POST /galaxies.json
  def create
    @galaxy = Galaxy.new(galaxy_params)

    respond_to do |format|
      if @galaxy.save
        format.html { redirect_to @galaxy, notice: 'Galaxy was successfully created.' }
        format.json { render :show, status: :created, location: @galaxy }
      else
        format.html { render :new }
        format.json { render json: @galaxy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /galaxies/1
  # PATCH/PUT /galaxies/1.json
  def update
    respond_to do |format|
      if @galaxy.update(galaxy_params)
        format.html { redirect_to @galaxy, notice: 'Galaxy was successfully updated.' }
        format.json { render :show, status: :ok, location: @galaxy }
      else
        format.html { render :edit }
        format.json { render json: @galaxy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galaxies/1
  # DELETE /galaxies/1.json
  def destroy
    @galaxy.destroy
    respond_to do |format|
      format.html { redirect_to galaxies_url, notice: 'Galaxy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #ransack advanced search
  def search
    #galaxy_id included for measurements search path
    if params[:q].has_key?(:galaxy_id_eq)
      show
    else
      index
    end
  end

  private
    def set_galaxy
      @galaxy = Galaxy.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render 'errors/404'
    end

    def galaxy_params
      params.require(:galaxy).permit(:id, :galaxy_name, :galaxy_type, :distance, :luminosity, :scale_length, :mass_hydrogen,
                                     :mass_disk, :stars, :vcr, :n, :r0, :n_g, :r_0, :sigma0,
                                     :r, :r_err_min, :r_err_max, :vrot_data, :vrot_data_err_min, :vrot_data_err_max,
                                     :page)
    end
end
