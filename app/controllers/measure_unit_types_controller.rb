# frozen_string_literal: true

class MeasureUnitTypesController < ApplicationController
  before_action :set_measure_unit_type, only: %i[ show edit update destroy ]

  # GET /measure_unit_types or /measure_unit_types.json
  def index
    @measure_unit_types = MeasureUnitType.all
  end

  # GET /measure_unit_types/1 or /measure_unit_types/1.json
  def show
  end

  # GET /measure_unit_types/new
  def new
    @measure_unit_type = MeasureUnitType.new
  end

  # GET /measure_unit_types/1/edit
  def edit
  end

  # POST /measure_unit_types or /measure_unit_types.json
  def create
    @measure_unit_type = MeasureUnitType.new(measure_unit_type_params)

    respond_to do |format|
      if @measure_unit_type.save
        format.html { redirect_to @measure_unit_type, notice: 'Measure unit type was successfully created.' }
        format.json { render :show, status: :created, location: @measure_unit_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @measure_unit_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /measure_unit_types/1 or /measure_unit_types/1.json
  def update
    respond_to do |format|
      if @measure_unit_type.update(measure_unit_type_params)
        format.html { redirect_to @measure_unit_type, notice: 'Measure unit type was successfully updated.' }
        format.json { render :show, status: :ok, location: @measure_unit_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @measure_unit_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measure_unit_types/1 or /measure_unit_types/1.json
  def destroy
    @measure_unit_type.destroy!

    respond_to do |format|
      format.html { redirect_to measure_unit_types_path, status: :see_other, notice: 'Measure unit type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measure_unit_type
      @measure_unit_type = MeasureUnitType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def measure_unit_type_params
      params.require(:measure_unit_type).permit(:name)
    end
end
