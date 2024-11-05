# frozen_string_literal: true

class Inventory::ItemsController < ApplicationController
  before_action :set_inventory_item, only: %i[ show edit update destroy ]

  # GET /inventory/items or /inventory/items.json
  def index
    @inventory_items = Inventory::Item.all
  end

  # GET /inventory/items/1 or /inventory/items/1.json
  def show
  end

  # GET /inventory/items/new
  def new
    @inventory_item = Inventory::Item.new
  end

  # GET /inventory/items/1/edit
  def edit
  end

  # POST /inventory/items or /inventory/items.json
  def create
    @inventory_item = Inventory::Item.new(inventory_item_params)

    respond_to do |format|
      if @inventory_item.save
        format.html { redirect_to @inventory_item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @inventory_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventory_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventory/items/1 or /inventory/items/1.json
  def update
    respond_to do |format|
      if @inventory_item.update(inventory_item_params)
        format.html { redirect_to @inventory_item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inventory_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory/items/1 or /inventory/items/1.json
  def destroy
    @inventory_item.destroy!

    respond_to do |format|
      format.html { redirect_to inventory_items_path, status: :see_other, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_item
      @inventory_item = Inventory::Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inventory_item_params
      params.require(:inventory_item).permit(:name, :sku, :description, :measure_unit_id)
    end
end
