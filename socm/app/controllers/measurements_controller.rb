class MeasurementsController < ApplicationController
  before_action :set_measurement, only: [:show, :edit, :update, :destroy]

  before_filter :find_galaxy

  # GET /measurements
  # GET /measurements.json
  def index
    @measurements = Measurement.all
    @galaxy = Galaxy.find(params[:galaxy_id])
  end

  # GET /measurements/1
  # GET /measurements/1.json
  def show
    @measurement = @galaxy.measurements.find(params[:id])
  end

  # GET /measurements/new
  def new
    @measurement = @galaxy.measurements.new
  end

  # GET /measurements/1/edit
  def edit
    @measurement = @galaxy.measurements.find(params[:id])
  end

  # POST /measurements
  # POST /measurements.json
  def create
    @measurement = @galaxy.measurements.new(measurement_params)#Measurement.new(measurement_params)

    respond_to do |format|
      if @measurement.save
        format.html { redirect_to @measurement, notice: 'Measurement was successfully created.' }
        format.json { render :show, status: :created, location: @measurement }
      else
        format.html { render :new }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /measurements/1
  # PATCH/PUT /measurements/1.json
  def update
    set_measurement
    respond_to do |format|
      if @measurement.update(measurement_params)
        format.html { redirect_to @measurement, notice: 'Measurement was successfully updated.' }
        format.json { render :show, status: :ok, location: @measurement }
      else
        format.html { render :edit }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measurements/1
  # DELETE /measurements/1.json
  def destroy
    @measurement.destroy
    respond_to do |format|
      format.html { redirect_to @galaxy, notice: 'Measurement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measurement
      find_galaxy
      @measurement = @galaxy.measurements.find(params[:id].to_i)#Measurement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def measurement_params
      params.require(:measurement).permit(:galaxy_id, :r, :r_err_min, :r_err_max, :vrot_data, :vrot_data_err_min, :vrot_data_err_max)
    end

    def find_galaxy
      @galaxy = Galaxy.find(params[:galaxy_id])
      puts "======================"
      puts "@galaxy = #{@galaxy.inspect}"
    end

    def measurement_url(measurement)
      url_for :controller => "measurements", :action => "show",
          :galaxy_id => measurement.galaxy.id, :id => measurement
    end
end
