# frozen_string_literal: true

class Configuration::ProductionLinesController < ApplicationController
  before_action :set_configuration_production_line, only: %i[ show edit update destroy ]

  # GET /configuration/production_lines or /configuration/production_lines.json
  def index
    @configuration_production_lines = Configuration::ProductionLine.all
  end

  # GET /configuration/production_lines/1 or /configuration/production_lines/1.json
  def show
  end

  # GET /configuration/production_lines/new
  def new
    @configuration_production_line = Configuration::ProductionLine.new
  end

  # GET /configuration/production_lines/1/edit
  def edit
  end

  # POST /configuration/production_lines or /configuration/production_lines.json
  def create
    @configuration_production_line = Configuration::ProductionLine.new(configuration_production_line_params)

    respond_to do |format|
      if @configuration_production_line.save
        format.html { redirect_to @configuration_production_line, notice: 'Production line was successfully created.' }
        format.json { render :show, status: :created, location: @configuration_production_line }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @configuration_production_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /configuration/production_lines/1 or /configuration/production_lines/1.json
  def update
    respond_to do |format|
      if @configuration_production_line.update(configuration_production_line_params)
        format.html { redirect_to @configuration_production_line, notice: 'Production line was successfully updated.' }
        format.json { render :show, status: :ok, location: @configuration_production_line }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @configuration_production_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /configuration/production_lines/1 or /configuration/production_lines/1.json
  def destroy
    @configuration_production_line.destroy!

    respond_to do |format|
      format.html { redirect_to configuration_production_lines_path, status: :see_other, notice: 'Production line was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_configuration_production_line
      @configuration_production_line = Configuration::ProductionLine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def configuration_production_line_params
      params.require(:configuration_production_line).permit(:code, :name, :description, :configuration_area_id, :active)
    end
end
