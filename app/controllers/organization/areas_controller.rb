# frozen_string_literal: true

class Organization::AreasController < ApplicationController
  # -- -------------------------------------------------------------------------
  # -- Constants ---------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Concerns ----------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Extensions --------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Callbacks ------------------------------------------------
  before_action :set_organization_area, only: %i[ show edit update destroy production_lines ]

  # -- -------------------------------------------------------------------------
  # -- Helper methods ----------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Actions -----------------------------------------------------------------

  # GET /organization/areas or /organization/areas.json
  def index
    @pagy, @records = pagy(Organization::Area.all)
  end

  # GET /organization/areas/1 or /organization/areas/1.json
  def show
  end

  # GET /organization/areas/new
  def new
    @organization_area = Organization::Area.new
  end

  # GET /organization/areas/1/edit
  def edit
  end

  # POST /organization/areas or /organization/areas.json
  def create
    @organization_area = Organization::Area.new(organization_area_params)

    respond_to do |format|
      if @organization_area.save
        format.html { redirect_to @organization_area, notice: t('.notice') }
        format.json { render :show, status: :created, location: @organization_area }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @organization_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organization/areas/1 or /organization/areas/1.json
  def update
    respond_to do |format|
      if @organization_area.update(organization_area_params)
        format.html { redirect_to @organization_area, notice: t('.notice') }
        format.json { render :show, status: :ok, location: @organization_area }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organization_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organization/areas/1 or /organization/areas/1.json
  def destroy
    @organization_area.destroy!

    respond_to do |format|
      format.html { redirect_to organization_areas_path, status: :see_other, notice: t('.notice') }
      format.json { head :no_content }
    end
  end

  def production_lines
    production_lines = Organization::Area.find(params[:id]).production_lines
    render turbo_stream: turbo_stream.replace(
      'production_lines_select',
      partial: 'organization/production_lines/production_line_select',
      locals: { production_lines: production_lines }
    )
  end

  # -- -------------------------------------------------------------------------
  # -- Protected Methods -------------------------------------------------------

  protected

  # -- -------------------------------------------------------------------------
  # -- Private Methods ---------------------------------------------------------

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_organization_area
      @organization_area = Organization::Area.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def organization_area_params
      params.expect(organization_area: %i[code name description organization_plant_id status])
    end
end
