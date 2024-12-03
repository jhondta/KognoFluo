# frozen_string_literal: true

class Maintenance::AssetsController < ApplicationController
  # -- -------------------------------------------------------------------------
  # -- Constants ---------------------------------------------------------------
  PERMITTED_ATTRIBUTES =
    [ :code, :name, :maintenance_asset_type_id,
      :organization_production_line_id, :maintenance_manufacturer_id, :model,
      :serial_number, :manufacturing_date, :purchase_date, :warranty_expiration,
      :status, :criticality_level, :physical_location, :notes,
      technical_specs: {},
      components_attributes: [ %i[id name description quantity specifications
                                  replacement_period status] ],
      documents_attributes: [ %i[id document_type name description version
                                 expiration_date status] ],
      assignees_attributes: [ %i[id maintenance_technician_id] ] ].freeze

  # -- -------------------------------------------------------------------------
  # -- Concerns ----------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Extensions --------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Callbacks ---------------------------------------------------------------
  before_action :set_maintenance_asset,
                only: %i[show edit update destroy components]
  before_action :load_collections, only: %i[new edit create update]

  # -- -------------------------------------------------------------------------
  # -- Helper methods ----------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Actions ----------------------------------------------------------------

  # GET /maintenance/assets or /maintenance/assets.json
  def index
    options = [ :type, :manufacturer, :rich_text_notes, production_line: { area: :plant } ]

    respond_to do |format|
      format.html do
        @pagy, @maintenance_assets = pagy(Maintenance::Asset.includes(options).all)
      end
      format.json do
        @maintenance_assets = Maintenance::Asset.includes(options).all
      end
    end
  end

  # GET /maintenance/assets/1 or /maintenance/assets/1.json
  def show
  end

  # GET /maintenance/assets/new
  def new
    @maintenance_asset = Maintenance::Asset.new
  end

  # GET /maintenance/assets/1/edit
  def edit
    @maintenance_asset.components.build if @maintenance_asset.components.empty?
    @areas = @maintenance_asset.plant.areas
    @production_lines = @maintenance_asset.area.production_lines
  end

  # POST /maintenance/assets or /maintenance/assets.json
  def create
    @maintenance_asset = Maintenance::Asset.new(maintenance_asset_params)

    respond_to do |format|
      if @maintenance_asset.save
        format.html { redirect_to @maintenance_asset, notice: t('.notice') }
        format.json { render :show, status: :created,
                             location: @maintenance_asset }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maintenance_asset.errors,
                             status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenance/assets/1 or /maintenance/assets/1.json
  def update
    respond_to do |format|
      if @maintenance_asset.update(maintenance_asset_params)
        format.html { redirect_to @maintenance_asset, notice: t('.notice') }
        format.json { render :show, status: :ok, location: @maintenance_asset }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maintenance_asset.errors,
                             status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance/assets/1 or /maintenance/assets/1.json
  def destroy
    @maintenance_asset.destroy!

    respond_to do |format|
      format.html { redirect_to maintenance_assets_path, status: :see_other,
                                notice: t('.notice') }
      format.json { head :no_content }
    end
  end

  def components
    components = @maintenance_asset.components
    target = params[:target]

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update(
          target,
          partial: 'maintenance/assets/components',
          locals: { components: components,
                    include_blank: params[:keep_placeholder],
                    prompt: params[:prompt] }
        )
      end
    end
  end

  # -- -------------------------------------------------------------------------
  # -- Protected Methods -------------------------------------------------------

  protected

  # -- -------------------------------------------------------------------------
  # -- Private Methods ---------------------------------------------------------

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_maintenance_asset
    options = [ :type, :manufacturer, :rich_text_notes,
               production_line: { area: :plant } ]
    @maintenance_asset = Maintenance::Asset.includes(options)
                                           .find(params[:id])
  end

  # Load collections for new and edit actions
  def load_collections
    @asset_types = Maintenance::AssetType.all
    @manufacturers = Maintenance::Manufacturer.all
    @plants = Organization::Plant.all
  end

  # Only allow a list of trusted parameters through.
  def maintenance_asset_params
    params.expect(maintenance_asset: PERMITTED_ATTRIBUTES)
  end
end
