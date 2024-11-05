# frozen_string_literal: true

class Inventory::ItemCategoriesController < ApplicationController
  before_action :set_inventory_item_category, only: %i[ show edit update destroy ]

  # GET /inventory/item_categories or /inventory/item_categories.json
  def index
    @inventory_item_categories = Inventory::ItemCategory.all
  end

  # GET /inventory/item_categories/1 or /inventory/item_categories/1.json
  def show
  end

  # GET /inventory/item_categories/new
  def new
    @inventory_item_category = Inventory::ItemCategory.new
  end

  # GET /inventory/item_categories/1/edit
  def edit
  end

  # POST /inventory/item_categories or /inventory/item_categories.json
  def create
    @inventory_item_category = Inventory::ItemCategory.new(inventory_item_category_params)

    respond_to do |format|
      if @inventory_item_category.save
        format.html { redirect_to @inventory_item_category, notice: 'Item category was successfully created.' }
        format.json { render :show, status: :created, location: @inventory_item_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventory_item_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventory/item_categories/1 or /inventory/item_categories/1.json
  def update
    respond_to do |format|
      if @inventory_item_category.update(inventory_item_category_params)
        format.html { redirect_to @inventory_item_category, notice: 'Item category was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory_item_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inventory_item_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory/item_categories/1 or /inventory/item_categories/1.json
  def destroy
    @inventory_item_category.destroy!

    respond_to do |format|
      format.html { redirect_to inventory_item_categories_path, status: :see_other, notice: 'Item category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_item_category
      @inventory_item_category = Inventory::ItemCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inventory_item_category_params
      params.require(:inventory_item_category).permit(:inventory_item_id, :inventory_category_id)
    end
end
