class CitationsController < ApplicationController
  before_action :set_citation, only: [:show, :edit, :update, :destroy]

  before_filter except: [:index, :show, :search] do
    render "errors/401" unless current_admin
  end

  # GET /citations
  # GET /citations.json
  def index
    @q = Citation.search(params[:q])
    @q.sorts = 'id asc' if @q.sorts.empty?
    if params[:page] != "false"
      @citations = @q.result(distinct: true).page(params[:page])
    else
      @citations = @q.result(distinct: true)
    end

    respond_to do |format|
      format.html { render :index }
      format.json { render :json => @citations.to_json(
         :only => [:title, :author, :bibtex, :journal, :year,
                   :volume, :pages, :month, :note, :key]
         )
      }
    end
  end

  # GET /citations/1
  # GET /citations/1.json
  def show
    @citation = Citation.find(params[:id])
    @galaxies = @citation.galaxies
    @citation.galaxy_ids_array

    respond_to do |format|
      format.html { render :show }
      format.json { render :json => @citation.to_json(
          :only => [:title, :author, :bibtex, :journal, :year,
                   :volume, :pages, :month, :note, :key],
          :methods => [:galaxy_ids_array]
        )
      }
    end
  end

  # GET /citations/new
  def new
    @citation = Citation.new
  end

  # GET /citations/1/edit
  def edit
  end

  # POST /citations
  # POST /citations.json
  def create
    @citation = Citation.new(citation_params)
    respond_to do |format|
      if @citation.save
        format.html { redirect_to @citation, notice: 'Citation was successfully created.' }
        format.json { render :show, status: :created, location: @citation }
      else
        format.html { render :new }
        format.json { render json: @citation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /citations/1
  # PATCH/PUT /citations/1.json
  def update
    respond_to do |format|
      if @citation.update(citation_params)
        format.html { redirect_to @citation, notice: 'Citation was successfully updated.' }
        format.json { render :show, status: :ok, location: @citation }
      else
        format.html { render :edit }
        format.json { render json: @citation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /citations/1
  # DELETE /citations/1.json
  def destroy
    @citation.destroy
    respond_to do |format|
      format.html { redirect_to @citation, notice: 'Citation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #ransack advanced search
  def search
    index
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def citation_params
      params.require(:citation).permit(:id, :q, :author, :title, :bibtex, :journal, :year,
                                       :volume, :number, :pages, :month, :note, :key, :galaxy_ids => [])
    end

    def set_citation
      @citation = Citation.find(params[:id]) if params[:id]
      rescue ActiveRecord::RecordNotFound
        render 'errors/404'
    end

    def citation_url(citation)
      url_for :controller => "citations", :action => "show",
          :id => citation
    end

end
