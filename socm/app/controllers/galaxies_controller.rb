class GalaxiesController < ApplicationController
  before_action :set_galaxy, only: [:show, :edit, :update, :destroy]

  # GET /galaxies
  # GET /galaxies.json
  def index
    @q = Galaxy.search(params[:q])
    @galaxies = @q.result(distinct: true)
  end

  # GET /galaxies/1
  # GET /galaxies/1.json
  def show
    #@q = Measurement.search(params[:q])
    @galaxy = Galaxy.find(params[:id].to_i)
    @q = @galaxy.measurements.search(params[:q])
    @measurements = @q.result(distinct: true)
    #@galaxy = @q.result.includes(:measurements)
    #@measurements = @galaxy.measurements.all
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
    puts "---------------"
    puts "params = #{params.inspect}"
    if params[:q].has_key?(:galaxy_id_eq)
      puts "==============="
      puts "params has galaxy ID"
      show
      render :show
    else
      puts "==============="
      puts "NO galaxy id"
      index
      render :index
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_galaxy
      @galaxy = Galaxy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def galaxy_params
      params.require(:galaxy).permit(:galaxy)
    end
end
