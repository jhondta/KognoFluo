# frozen_string_literal: true

class Maintenance::AssetsController < ApplicationController
  before_action :set_maintenance_asset, only: %i[show edit update destroy]
  before_action :load_collections, only: %i[new edit create update]

  # GET /maintenance/assets or /maintenance/assets.json
  def index
    includes = [ :type, :manufacturer, production_line: { area: :plant } ]
    @pagy, @records = pagy(Maintenance::Asset.includes(includes).all)
  end

  # GET /maintenance/assets/1 or /maintenance/assets/1.json
  def show
    # Loads the hierarchy from the production line
    @area = @maintenance_asset.production_line.area
    @plant = @area.plant
  end

  # GET /maintenance/assets/new
  def new
    @maintenance_asset = Maintenance::Asset.new
    # Load the hierarchy from the production line
    @organization_areas = []
    @organization_production_lines = []
  end

  # GET /maintenance/assets/1/edit
  def edit
    # Load the hierarchy from the production line
    production_line = @maintenance_asset.production_line
    @area = production_line.area
    @plant = @area.plant

    # Filter the collections according to the production line
    @organization_areas = Organization::Area.where(organization_plant_id: @plant.id)
    @organization_production_lines = Organization::ProductionLine.where(organization_area_id: @area.id)
  end

  # POST /maintenance/assets or /maintenance/assets.json
  def create
    @maintenance_asset = Maintenance::Asset.new(maintenance_asset_params)

    # If there is an error, reload the filtered collections according to the parameters
    if maintenance_asset_params[:organization_production_line_id].present?
      production_line = Organization::ProductionLine.find_by(id: maintenance_asset_params[:organization_production_line_id])
      if production_line
        @area = production_line.area
        @plant = @area.plant
        @organization_areas = Organization::Area.where(organization_plant_id: @plant.id)
        @organization_production_lines = Organization::ProductionLine.where(organization_area_id: @area.id)
      end
    end

    respond_to do |format|
      if @maintenance_asset.save
        format.html { redirect_to @maintenance_asset, notice: t('.notice') }
        format.json { render :show, status: :created, location: @maintenance_asset }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maintenance_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenance/assets/1 or /maintenance/assets/1.json
  def update
    # If there is an error, reload the filtered collections according to the parameters
    unless @maintenance_asset.update(maintenance_asset_params)
      production_line = @maintenance_asset.production_line
      @area = production_line.area
      @plant = @area.plant
      @organization_areas = Organization::Area.where(organization_plant_id: @plant.id)
      @organization_production_lines = Organization::ProductionLine.where(organization_area_id: @area.id)
    end

    respond_to do |format|
      if @maintenance_asset.errors.empty?
        format.html { redirect_to @maintenance_asset, notice: t('.notice') }
        format.json { render :show, status: :ok, location: @maintenance_asset }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maintenance_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance/assets/1 or /maintenance/assets/1.json
  def destroy
    @maintenance_asset.destroy!

    respond_to do |format|
      format.html { redirect_to maintenance_assets_path, status: :see_other, notice: t('.notice') }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_asset
      @maintenance_asset = Maintenance::Asset.find(params.expect(:id))
    end

    # Load collections for new and edit actions
    def load_collections
      @maintenance_asset_types = Maintenance::AssetType.all
      @maintenance_manufacturers = Maintenance::Manufacturer.all
      @organization_plants = Organization::Plant.all
    end

    # Only allow a list of trusted parameters through.
    def maintenance_asset_params
      params.expect(maintenance_asset: %i[ code name maintenance_asset_type_id organization_production_line_id maintenance_manufacturer_id model serial_number manufacturing_date purchase_date warranty_expiration status criticality_level physical_location notes technical_specs: {}])
    end
end
