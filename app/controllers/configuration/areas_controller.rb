# frozen_string_literal: true

class Configuration::AreasController < ApplicationController
  before_action :set_configuration_area, only: %i[ show edit update destroy ]

  # GET /configuration/areas or /configuration/areas.json
  def index
    @configuration_areas = Configuration::Area.all
  end

  # GET /configuration/areas/1 or /configuration/areas/1.json
  def show
  end

  # GET /configuration/areas/new
  def new
    @configuration_area = Configuration::Area.new
  end

  # GET /configuration/areas/1/edit
  def edit
  end

  # POST /configuration/areas or /configuration/areas.json
  def create
    @configuration_area = Configuration::Area.new(configuration_area_params)

    respond_to do |format|
      if @configuration_area.save
        format.html { redirect_to @configuration_area, notice: 'Area was successfully created.' }
        format.json { render :show, status: :created, location: @configuration_area }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @configuration_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /configuration/areas/1 or /configuration/areas/1.json
  def update
    respond_to do |format|
      if @configuration_area.update(configuration_area_params)
        format.html { redirect_to @configuration_area, notice: 'Area was successfully updated.' }
        format.json { render :show, status: :ok, location: @configuration_area }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @configuration_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /configuration/areas/1 or /configuration/areas/1.json
  def destroy
    @configuration_area.destroy!

    respond_to do |format|
      format.html { redirect_to configuration_areas_path, status: :see_other, notice: 'Area was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_configuration_area
      @configuration_area = Configuration::Area.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def configuration_area_params
      params.require(:configuration_area).permit(:code, :name, :description, :configuration_plant_id, :active)
    end
end
