# frozen_string_literal: true

class Common::MeasureUnitsController < ApplicationController
  before_action :set_common_measure_unit, only: %i[ show edit update destroy ]

  # GET /common/measure_units or /common/measure_units.json
  def index
    @common_measure_units = Common::MeasureUnit.all
  end

  # GET /common/measure_units/1 or /common/measure_units/1.json
  def show
  end

  # GET /common/measure_units/new
  def new
    @common_measure_unit = Common::MeasureUnit.new
  end

  # GET /common/measure_units/1/edit
  def edit
  end

  # POST /common/measure_units or /common/measure_units.json
  def create
    @common_measure_unit = Common::MeasureUnit.new(common_measure_unit_params)

    respond_to do |format|
      if @common_measure_unit.save
        format.html { redirect_to @common_measure_unit, notice: 'Measure unit was successfully created.' }
        format.json { render :show, status: :created, location: @common_measure_unit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @common_measure_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /common/measure_units/1 or /common/measure_units/1.json
  def update
    respond_to do |format|
      if @common_measure_unit.update(common_measure_unit_params)
        format.html { redirect_to @common_measure_unit, notice: 'Measure unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @common_measure_unit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @common_measure_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /common/measure_units/1 or /common/measure_units/1.json
  def destroy
    @common_measure_unit.destroy!

    respond_to do |format|
      format.html { redirect_to common_measure_units_path, status: :see_other, notice: 'Measure unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_common_measure_unit
      @common_measure_unit = Common::MeasureUnit.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def common_measure_unit_params
      params.expect(common_measure_unit: %i[name abbreviation common_measure_unit_type_id])
    end
end
