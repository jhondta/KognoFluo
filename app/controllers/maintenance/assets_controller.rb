# frozen_string_literal: true

class Maintenance::AssetsController < ApplicationController
  before_action :set_maintenance_asset, only: %i[ show edit update destroy ]

  # GET /maintenance/assets or /maintenance/assets.json
  def index
    includes = [ :type, :manufacturer, production_line: { area: :plant } ]
    @pagy, @records = pagy(Maintenance::Asset.includes(includes).all)
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
  end

  # POST /maintenance/assets or /maintenance/assets.json
  def create
    @maintenance_asset = Maintenance::Asset.new(maintenance_asset_params)

    respond_to do |format|
      if @maintenance_asset.save
        format.html { redirect_to @maintenance_asset, notice: 'Asset was successfully created.' }
        format.json { render :show, status: :created, location: @maintenance_asset }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maintenance_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenance/assets/1 or /maintenance/assets/1.json
  def update
    respond_to do |format|
      if @maintenance_asset.update(maintenance_asset_params)
        format.html { redirect_to @maintenance_asset, notice: 'Asset was successfully updated.' }
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
      format.html { redirect_to maintenance_assets_path, status: :see_other, notice: 'Asset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_asset
      @maintenance_asset = Maintenance::Asset.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def maintenance_asset_params
      params.expect(maintenance_asset: %i[code name maintenance_asset_type_id organization_area_id maintenance_manufacturer_id model serial_number manufacturing_date purchase_date warranty_expiration status criticality_level technical_specs operation_conditions physical_location notes active])
    end
end
