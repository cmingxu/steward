class StewardKpisController < ApplicationController
  before_action :set_steward_kpi, only: [:show, :edit, :update, :destroy]

  # GET /steward_kpis
  # GET /steward_kpis.json
  def index
    @steward_kpis = StewardKpi.all
  end

  # GET /steward_kpis/1
  # GET /steward_kpis/1.json
  def show
  end

  # GET /steward_kpis/new
  def new
    @steward_kpi = StewardKpi.new
  end

  # GET /steward_kpis/1/edit
  def edit
  end

  # POST /steward_kpis
  # POST /steward_kpis.json
  def create
    @steward_kpi = StewardKpi.new(steward_kpi_params)

    respond_to do |format|
      if @steward_kpi.save
        format.html { redirect_to @steward_kpi, notice: 'Steward kpi was successfully created.' }
        format.json { render :show, status: :created, location: @steward_kpi }
      else
        format.html { render :new }
        format.json { render json: @steward_kpi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /steward_kpis/1
  # PATCH/PUT /steward_kpis/1.json
  def update
    respond_to do |format|
      if @steward_kpi.update(steward_kpi_params)
        format.html { redirect_to @steward_kpi, notice: 'Steward kpi was successfully updated.' }
        format.json { render :show, status: :ok, location: @steward_kpi }
      else
        format.html { render :edit }
        format.json { render json: @steward_kpi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /steward_kpis/1
  # DELETE /steward_kpis/1.json
  def destroy
    @steward_kpi.destroy
    respond_to do |format|
      format.html { redirect_to steward_kpis_url, notice: 'Steward kpi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_steward_kpi
      @steward_kpi = StewardKpi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def steward_kpi_params
      params.require(:steward_kpi).permit(:code, :resource, :code_type, :query_plan, :position, :ancestry)
    end
end
