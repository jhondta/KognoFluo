# frozen_string_literal: true

class Organization::PlantsController < ApplicationController
  before_action :set_organization_plant, only: %i[ show edit update destroy ]

  # GET /organization/plants or /organization/plants.json
  def index
    @organization_plants = Organization::Plant.all
  end

  # GET /organization/plants/1 or /organization/plants/1.json
  def show
  end

  # GET /organization/plants/new
  def new
    @organization_plant = Organization::Plant.new
  end

  # GET /organization/plants/1/edit
  def edit
  end

  # POST /organization/plants or /organization/plants.json
  def create
    @organization_plant = Organization::Plant.new(organization_plant_params)

    respond_to do |format|
      if @organization_plant.save
        format.html { redirect_to @organization_plant, notice: t('.notice') }
        format.json { render :show, status: :created, location: @organization_plant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @organization_plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organization/plants/1 or /organization/plants/1.json
  def update
    respond_to do |format|
      if @organization_plant.update(organization_plant_params)
        format.html { redirect_to @organization_plant, notice: t('.notice') }
        format.json { render :show, status: :ok, location: @organization_plant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organization_plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organization/plants/1 or /organization/plants/1.json
  def destroy
    @organization_plant.destroy!

    respond_to do |format|
      format.html { redirect_to organization_plants_path, status: :see_other, notice: t('.notice') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization_plant
      @organization_plant = Organization::Plant.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def organization_plant_params
      params.expect(organization_plant: %i[code name address status])
    end
end
