class StewardKpisController < ApplicationController
  before_action :set_steward_kpi, only: [:edit, :update, :destroy, :show]

  # GET /steward_kpis
  # GET /steward_kpis.json
  def index
    if params[:parent_id].present?
      @steward_kpis = StewardKpi.find(params[:parent_id]).children
      @parent_id = params[:parent_id]
      @parent = StewardKpi.find(params[:parent_id])
    else
      @steward_kpis = StewardKpi.roots
    end
  end

  # GET /steward_kpis/new
  def new
    @steward_kpi = StewardKpi.new()
    @parent_id = params[:parent_id]
  end

  # GET /steward_kpis/1/edit
  def edit
  end

  def show
    render json: @steward_kpi.query_kpi_data(params[:query])
  end

  # POST /steward_kpis
  # POST /steward_kpis.json
  def create
    if params[:steward_kpi][:parent_id].present?
      steward_kpi = StewardKpi.find(params[:steward_kpi][:parent_id]).children
    else
      steward_kpi = StewardKpi
    end
    @steward_kpi = steward_kpi.new(steward_kpi_params)

    respond_to do |format|
      if @steward_kpi.save
        format.html { redirect_to steward_kpis_path(parent_id: @steward_kpi.parent_id), notice: 'Steward kpi was successfully created.' }
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
        format.html { redirect_to steward_kpis_path(parent_id: @steward_kpi.parent_id), notice: 'Steward kpi was successfully updated.' }
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
      params.require(:steward_kpi).permit(:code, :resource, :code_type, :query_plan, :position, :ancestry, :node_type,
        steward_page_widgets_attributes: [:id, :widget_type, :label, :options, :name, :_destroy])
    end
end
