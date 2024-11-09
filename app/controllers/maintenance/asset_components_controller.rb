# frozen_string_literal: true

class Maintenance::AssetComponentsController < ApplicationController
  before_action :set_maintenance_asset_component, only: %i[ show edit update destroy ]

  # GET /maintenance/asset_components or /maintenance/asset_components.json
  def index
    @maintenance_asset_components = Maintenance::AssetComponent.all
  end

  # GET /maintenance/asset_components/1 or /maintenance/asset_components/1.json
  def show
  end

  # GET /maintenance/asset_components/new
  def new
    @maintenance_asset_component = Maintenance::AssetComponent.new
  end

  # GET /maintenance/asset_components/1/edit
  def edit
  end

  # POST /maintenance/asset_components or /maintenance/asset_components.json
  def create
    @maintenance_asset_component = Maintenance::AssetComponent.new(maintenance_asset_component_params)

    respond_to do |format|
      if @maintenance_asset_component.save
        format.html { redirect_to @maintenance_asset_component, notice: t('.notice') }
        format.json { render :show, status: :created, location: @maintenance_asset_component }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maintenance_asset_component.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenance/asset_components/1 or /maintenance/asset_components/1.json
  def update
    respond_to do |format|
      if @maintenance_asset_component.update(maintenance_asset_component_params)
        format.html { redirect_to @maintenance_asset_component, notice: t('.notice') }
        format.json { render :show, status: :ok, location: @maintenance_asset_component }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maintenance_asset_component.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance/asset_components/1 or /maintenance/asset_components/1.json
  def destroy
    @maintenance_asset_component.destroy!

    respond_to do |format|
      format.html { redirect_to maintenance_asset_components_path, status: :see_other, notice: t('.notice') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_asset_component
      @maintenance_asset_component = Maintenance::AssetComponent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def maintenance_asset_component_params
      params.expect(maintenance_asset_component: %i[ :maintenance_asset_id, :name, :description, :quantity, :specifications, :replacement_period, :active ])
    end
end
