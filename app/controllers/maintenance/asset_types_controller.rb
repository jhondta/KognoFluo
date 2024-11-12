# frozen_string_literal: true

class Maintenance::AssetTypesController < ApplicationController
  before_action :set_maintenance_asset_type, only: %i[ show edit update destroy ]

  # GET /maintenance/asset_types or /maintenance/asset_types.json
  def index
    @pagy, @records = pagy(Maintenance::AssetType.all)
  end

  # GET /maintenance/asset_types/1 or /maintenance/asset_types/1.json
  def show
  end

  # GET /maintenance/asset_types/new
  def new
    @maintenance_asset_type = Maintenance::AssetType.new
  end

  # GET /maintenance/asset_types/1/edit
  def edit
  end

  # POST /maintenance/asset_types or /maintenance/asset_types.json
  def create
    @maintenance_asset_type = Maintenance::AssetType.new(maintenance_asset_type_params)

    respond_to do |format|
      if @maintenance_asset_type.save
        format.html { redirect_to @maintenance_asset_type, notice: t('.notice') }
        format.json { render :show, status: :created, location: @maintenance_asset_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maintenance_asset_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenance/asset_types/1 or /maintenance/asset_types/1.json
  def update
    respond_to do |format|
      if @maintenance_asset_type.update(maintenance_asset_type_params)
        format.html { redirect_to @maintenance_asset_type, notice: t('.notice') }
        format.json { render :show, status: :ok, location: @maintenance_asset_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maintenance_asset_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance/asset_types/1 or /maintenance/asset_types/1.json
  def destroy
    @maintenance_asset_type.destroy!

    respond_to do |format|
      format.html { redirect_to maintenance_asset_types_path, status: :see_other, notice: t('.notice') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_asset_type
      @maintenance_asset_type = Maintenance::AssetType.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def maintenance_asset_type_params
      params.expect(maintenance_asset_type: %i[code name description status])
    end
end
