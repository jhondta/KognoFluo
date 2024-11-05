# frozen_string_literal: true

class Maintenance::EquipmentController < ApplicationController
  before_action :set_maintenance_equipment, only: %i[ show edit update destroy ]

  # GET /maintenance/equipment or /maintenance/equipment.json
  def index
    @maintenance_equipment = Maintenance::Equipment.all
  end

  # GET /maintenance/equipment/1 or /maintenance/equipment/1.json
  def show
  end

  # GET /maintenance/equipment/new
  def new
    @maintenance_equipment = Maintenance::Equipment.new
  end

  # GET /maintenance/equipment/1/edit
  def edit
  end

  # POST /maintenance/equipment or /maintenance/equipment.json
  def create
    @maintenance_equipment = Maintenance::Equipment.new(maintenance_equipment_params)

    respond_to do |format|
      if @maintenance_equipment.save
        format.html { redirect_to @maintenance_equipment, notice: 'Equipment was successfully created.' }
        format.json { render :show, status: :created, location: @maintenance_equipment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maintenance_equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenance/equipment/1 or /maintenance/equipment/1.json
  def update
    respond_to do |format|
      if @maintenance_equipment.update(maintenance_equipment_params)
        format.html { redirect_to @maintenance_equipment, notice: 'Equipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @maintenance_equipment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maintenance_equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance/equipment/1 or /maintenance/equipment/1.json
  def destroy
    @maintenance_equipment.destroy!

    respond_to do |format|
      format.html { redirect_to maintenance_equipment_index_path, status: :see_other, notice: 'Equipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_equipment
      @maintenance_equipment = Maintenance::Equipment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def maintenance_equipment_params
      params.require(:maintenance_equipment).permit(:name, :description, :image, :location, :status)
    end
end
