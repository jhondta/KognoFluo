# frozen_string_literal: true

class Maintenance::AssetAssigneesController < ApplicationController
  before_action :set_maintenance_asset_assignee, only: %i[ show edit update destroy ]

  # GET /maintenance/asset_assignees or /maintenance/asset_assignees.json
  def index
    @maintenance_asset_assignees = Maintenance::AssetAssignee.all
  end

  # GET /maintenance/asset_assignees/1 or /maintenance/asset_assignees/1.json
  def show
  end

  # GET /maintenance/asset_assignees/new
  def new
    @maintenance_asset_assignee = Maintenance::AssetAssignee.new
  end

  # GET /maintenance/asset_assignees/1/edit
  def edit
  end

  # POST /maintenance/asset_assignees or /maintenance/asset_assignees.json
  def create
    @maintenance_asset_assignee = Maintenance::AssetAssignee.new(maintenance_asset_assignee_params)

    respond_to do |format|
      if @maintenance_asset_assignee.save
        format.html { redirect_to @maintenance_asset_assignee, notice: 'Asset assignee was successfully created.' }
        format.json { render :show, status: :created, location: @maintenance_asset_assignee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maintenance_asset_assignee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenance/asset_assignees/1 or /maintenance/asset_assignees/1.json
  def update
    respond_to do |format|
      if @maintenance_asset_assignee.update(maintenance_asset_assignee_params)
        format.html { redirect_to @maintenance_asset_assignee, notice: 'Asset assignee was successfully updated.' }
        format.json { render :show, status: :ok, location: @maintenance_asset_assignee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maintenance_asset_assignee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance/asset_assignees/1 or /maintenance/asset_assignees/1.json
  def destroy
    @maintenance_asset_assignee.destroy!

    respond_to do |format|
      format.html { redirect_to maintenance_asset_assignees_path, status: :see_other, notice: 'Asset assignee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_asset_assignee
      @maintenance_asset_assignee = Maintenance::AssetAssignee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def maintenance_asset_assignee_params
      params.require(:maintenance_asset_assignee).permit(:maintenance_asset_id, :maintenance_technician_id)
    end
end
