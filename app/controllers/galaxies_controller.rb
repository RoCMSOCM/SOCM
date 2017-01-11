class GalaxiesController < ApplicationController
  before_action :set_galaxy, only: [:show, :edit, :update, :destroy, :index_galaxy_citations]

  before_filter except: [:index, :show, :index_galaxy_citations, :search, :new, :create] do
    render "errors/401", :status => :unauthorized unless current_admin
  end

  # GET /galaxies
  # GET /galaxies.json
  def index
    @q = Galaxy.search(params[:q])
    @q.sorts = 'id asc' if @q.sorts.empty?
    if params[:page] != "false"
      @galaxies = @q.result(distinct: true).page(params[:page])
    else
      @galaxies = @q.result(distinct: true)
    end

    respond_to do |format|
      format.html { render :index }
      format.json { render :json => @galaxies.to_json(
         :only => [:id, :galaxy_name, :galaxy_type, :distance, :luminosity, :scale_length,
                      :mass_hydrogen, :mass_disk, :velocities_citation, :luminosity_citation, :mass_hydrogen_citation, :scale_length_citation],
          :methods => [:citation_ids_array, :r_last, :vrot_data_last, :velocities_count]
        )
      }
    end
  end

  # GET /galaxies/1
  # GET /galaxies/1.json
  def show
    @q = @galaxy.velocities.search(params[:q])
    @velocities = @q.result(distinct: true).page(params[:page])
    @citations = @galaxy.citations
    @galaxy.citation_ids_array

    #for view galaxy _citation reference
    #@author_vel_citation = Citation.find_by_id(@galaxy.velocities_citation).author if Citation.find_by_id(@galaxy.velocities_citation)
    @author_lum_citation = Citation.find_by_id(@galaxy.luminosity_citation).author if Citation.find_by_id(@galaxy.luminosity_citation)
    @author_scl_citation = Citation.find_by_id(@galaxy.scale_length_citation).author if Citation.find_by_id(@galaxy.scale_length_citation)
    @author_hyd_citation = Citation.find_by_id(@galaxy.mass_hydrogen_citation).author if Citation.find_by_id(@galaxy.mass_hydrogen_citation)

    respond_to do |format|
      format.html { render :show }
      format.json { render :json => @galaxy.to_json(
        :only => [:id, :galaxy_name, :galaxy_type, :distance, :luminosity, :scale_length,
                  :mass_hydrogen, :mass_disk, :citation_ids_array, :velocities_citation, :luminosity_citation, :mass_hydrogen_citation, :scale_length_citation],
                  :methods => [:citation_ids_array, :r_last, :vrot_data_last, :velocities_count]
      )
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
    #galaxy_id included for velocities search path
    if params[:q].has_key?(:galaxy_id_eq)
      set_galaxy
      show
    else
      index
    end
  end

  def index_galaxy_citations
    @q = @galaxy.citations.search(params[:q])
    @citations = @galaxy.citations.all
    render 'galaxy_citations_index'
  end

  # POST /import
  def import_galaxy
    Galaxy.import_csv(params[:file])
    redirect_to galaxies_url, notice: "Galaxies has been imported thank you very much!!!"
  end

  def import_galaxy_velocities
    Velocity.import_csv(params[:file])
    redirect_to galaxies_url, notice: "Velocities have been imported thank you very much!!!"
  end

  private
    def set_galaxy
      @galaxy = Galaxy.find(params[:id]) if params[:id]

      rescue ActiveRecord::RecordNotFound
        render 'errors/404'
    end

    def galaxy_params
      # includes params for all velocities attributes - used with ransack search for galaxy_velocities
      params.require(:galaxy).permit(:id, :q, :galaxy_name, :galaxy_type, :distance, :luminosity, :scale_length, :mass_hydrogen, :mass_disk,
                                     :galaxy_id, :r, :vrot_data, :vrot_data_error, :page, :luminosity_citation, 
                                     :scale_length_citation, :velocities_citation, :mass_hydrogen_citation, :citation_ids => [])
    end
end
