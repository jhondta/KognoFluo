# frozen_string_literal: true

class Inventory::CategoriesController < ApplicationController
  before_action :set_inventory_category, only: %i[ show edit update destroy ]

  # GET /inventory/categories or /inventory/categories.json
  def index
    @inventory_categories = Inventory::Category.all
  end

  # GET /inventory/categories/1 or /inventory/categories/1.json
  def show
  end

  # GET /inventory/categories/new
  def new
    @inventory_category = Inventory::Category.new
  end

  # GET /inventory/categories/1/edit
  def edit
  end

  # POST /inventory/categories or /inventory/categories.json
  def create
    @inventory_category = Inventory::Category.new(inventory_category_params)

    respond_to do |format|
      if @inventory_category.save
        format.html { redirect_to @inventory_category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @inventory_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventory_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventory/categories/1 or /inventory/categories/1.json
  def update
    respond_to do |format|
      if @inventory_category.update(inventory_category_params)
        format.html { redirect_to @inventory_category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inventory_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory/categories/1 or /inventory/categories/1.json
  def destroy
    @inventory_category.destroy!

    respond_to do |format|
      format.html { redirect_to inventory_categories_path, status: :see_other, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_category
      @inventory_category = Inventory::Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inventory_category_params
      params.require(:inventory_category).permit(:name, :description)
    end
end
