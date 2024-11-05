# frozen_string_literal: true

class Maintenance::FrequenciesController < ApplicationController
  before_action :set_maintenance_frequency, only: %i[ show edit update destroy ]

  # GET /maintenance/frequencies or /maintenance/frequencies.json
  def index
    @maintenance_frequencies = Maintenance::Frequency.all
  end

  # GET /maintenance/frequencies/1 or /maintenance/frequencies/1.json
  def show
  end

  # GET /maintenance/frequencies/new
  def new
    @maintenance_frequency = Maintenance::Frequency.new
  end

  # GET /maintenance/frequencies/1/edit
  def edit
  end

  # POST /maintenance/frequencies or /maintenance/frequencies.json
  def create
    @maintenance_frequency = Maintenance::Frequency.new(maintenance_frequency_params)

    respond_to do |format|
      if @maintenance_frequency.save
        format.html { redirect_to @maintenance_frequency, notice: 'Frequency was successfully created.' }
        format.json { render :show, status: :created, location: @maintenance_frequency }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maintenance_frequency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenance/frequencies/1 or /maintenance/frequencies/1.json
  def update
    respond_to do |format|
      if @maintenance_frequency.update(maintenance_frequency_params)
        format.html { redirect_to @maintenance_frequency, notice: 'Frequency was successfully updated.' }
        format.json { render :show, status: :ok, location: @maintenance_frequency }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maintenance_frequency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance/frequencies/1 or /maintenance/frequencies/1.json
  def destroy
    @maintenance_frequency.destroy!

    respond_to do |format|
      format.html { redirect_to maintenance_frequencies_path, status: :see_other, notice: 'Frequency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_frequency
      @maintenance_frequency = Maintenance::Frequency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def maintenance_frequency_params
      params.require(:maintenance_frequency).permit(:name, :description)
    end
end
