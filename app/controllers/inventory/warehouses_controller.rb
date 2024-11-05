# frozen_string_literal: true

class Inventory::WarehousesController < ApplicationController
  before_action :set_inventory_warehouse, only: %i[ show edit update destroy ]

  # GET /inventory/warehouses or /inventory/warehouses.json
  def index
    @inventory_warehouses = Inventory::Warehouse.all
  end

  # GET /inventory/warehouses/1 or /inventory/warehouses/1.json
  def show
  end

  # GET /inventory/warehouses/new
  def new
    @inventory_warehouse = Inventory::Warehouse.new
  end

  # GET /inventory/warehouses/1/edit
  def edit
  end

  # POST /inventory/warehouses or /inventory/warehouses.json
  def create
    @inventory_warehouse = Inventory::Warehouse.new(inventory_warehouse_params)

    respond_to do |format|
      if @inventory_warehouse.save
        format.html { redirect_to @inventory_warehouse, notice: 'Warehouse was successfully created.' }
        format.json { render :show, status: :created, location: @inventory_warehouse }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventory_warehouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventory/warehouses/1 or /inventory/warehouses/1.json
  def update
    respond_to do |format|
      if @inventory_warehouse.update(inventory_warehouse_params)
        format.html { redirect_to @inventory_warehouse, notice: 'Warehouse was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory_warehouse }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inventory_warehouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory/warehouses/1 or /inventory/warehouses/1.json
  def destroy
    @inventory_warehouse.destroy!

    respond_to do |format|
      format.html { redirect_to inventory_warehouses_path, status: :see_other, notice: 'Warehouse was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_warehouse
      @inventory_warehouse = Inventory::Warehouse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inventory_warehouse_params
      params.require(:inventory_warehouse).permit(:name, :location)
    end
end
