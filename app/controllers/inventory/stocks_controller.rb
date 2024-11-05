# frozen_string_literal: true

class Inventory::StocksController < ApplicationController
  before_action :set_inventory_stock, only: %i[ show edit update destroy ]

  # GET /inventory/stocks or /inventory/stocks.json
  def index
    @inventory_stocks = Inventory::Stock.all
  end

  # GET /inventory/stocks/1 or /inventory/stocks/1.json
  def show
  end

  # GET /inventory/stocks/new
  def new
    @inventory_stock = Inventory::Stock.new
  end

  # GET /inventory/stocks/1/edit
  def edit
  end

  # POST /inventory/stocks or /inventory/stocks.json
  def create
    @inventory_stock = Inventory::Stock.new(inventory_stock_params)

    respond_to do |format|
      if @inventory_stock.save
        format.html { redirect_to @inventory_stock, notice: 'Stock was successfully created.' }
        format.json { render :show, status: :created, location: @inventory_stock }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventory_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventory/stocks/1 or /inventory/stocks/1.json
  def update
    respond_to do |format|
      if @inventory_stock.update(inventory_stock_params)
        format.html { redirect_to @inventory_stock, notice: 'Stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory_stock }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inventory_stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory/stocks/1 or /inventory/stocks/1.json
  def destroy
    @inventory_stock.destroy!

    respond_to do |format|
      format.html { redirect_to inventory_stocks_path, status: :see_other, notice: 'Stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_stock
      @inventory_stock = Inventory::Stock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inventory_stock_params
      params.require(:inventory_stock).permit(:inventory_item_id, :inventory_warehouse_id, :quantity, :minimum, :maximum, :reorder_quantity)
    end
end
