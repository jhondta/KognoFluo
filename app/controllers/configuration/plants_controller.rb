# frozen_string_literal: true

class Configuration::PlantsController < ApplicationController
  before_action :set_configuration_plant, only: %i[ show edit update destroy ]

  # GET /configuration/plants or /configuration/plants.json
  def index
    @configuration_plants = Configuration::Plant.all
  end

  # GET /configuration/plants/1 or /configuration/plants/1.json
  def show
  end

  # GET /configuration/plants/new
  def new
    @configuration_plant = Configuration::Plant.new
  end

  # GET /configuration/plants/1/edit
  def edit
  end

  # POST /configuration/plants or /configuration/plants.json
  def create
    @configuration_plant = Configuration::Plant.new(configuration_plant_params)

    respond_to do |format|
      if @configuration_plant.save
        format.html { redirect_to @configuration_plant, notice: 'Plant was successfully created.' }
        format.json { render :show, status: :created, location: @configuration_plant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @configuration_plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /configuration/plants/1 or /configuration/plants/1.json
  def update
    respond_to do |format|
      if @configuration_plant.update(configuration_plant_params)
        format.html { redirect_to @configuration_plant, notice: 'Plant was successfully updated.' }
        format.json { render :show, status: :ok, location: @configuration_plant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @configuration_plant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /configuration/plants/1 or /configuration/plants/1.json
  def destroy
    @configuration_plant.destroy!

    respond_to do |format|
      format.html { redirect_to configuration_plants_path, status: :see_other, notice: 'Plant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_configuration_plant
      @configuration_plant = Configuration::Plant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def configuration_plant_params
      params.require(:configuration_plant).permit(:code, :name, :address, :active)
    end
end
