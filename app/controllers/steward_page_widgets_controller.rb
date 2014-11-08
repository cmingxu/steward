class StewardPageWidgetsController < ApplicationController
  before_action :set_steward_page_widget, only: [:show, :edit, :update, :destroy]

  # GET /steward_page_widgets
  # GET /steward_page_widgets.json
  def index
    @steward_page_widgets = StewardPageWidget.all
  end

  # GET /steward_page_widgets/1
  # GET /steward_page_widgets/1.json
  def show
  end

  # GET /steward_page_widgets/new
  def new
    @steward_page_widget = StewardPageWidget.new
  end

  # GET /steward_page_widgets/1/edit
  def edit
  end

  # POST /steward_page_widgets
  # POST /steward_page_widgets.json
  def create
    @steward_page_widget = StewardPageWidget.new(steward_page_widget_params)

    respond_to do |format|
      if @steward_page_widget.save
        format.html { redirect_to @steward_page_widget, notice: 'Steward page widget was successfully created.' }
        format.json { render :show, status: :created, location: @steward_page_widget }
      else
        format.html { render :new }
        format.json { render json: @steward_page_widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /steward_page_widgets/1
  # PATCH/PUT /steward_page_widgets/1.json
  def update
    respond_to do |format|
      if @steward_page_widget.update(steward_page_widget_params)
        format.html { redirect_to @steward_page_widget, notice: 'Steward page widget was successfully updated.' }
        format.json { render :show, status: :ok, location: @steward_page_widget }
      else
        format.html { render :edit }
        format.json { render json: @steward_page_widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /steward_page_widgets/1
  # DELETE /steward_page_widgets/1.json
  def destroy
    @steward_page_widget.destroy
    respond_to do |format|
      format.html { redirect_to steward_page_widgets_url, notice: 'Steward page widget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_steward_page_widget
      @steward_page_widget = StewardPageWidget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def steward_page_widget_params
      params.require(:steward_page_widget).permit(:widget_type, :label, :options, :steward_kpi_id, :param)
    end
end
