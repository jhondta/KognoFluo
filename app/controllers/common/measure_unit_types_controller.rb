# frozen_string_literal: true

class Common::MeasureUnitTypesController < ApplicationController
  before_action :set_common_measure_unit_type, only: %i[ show edit update destroy ]

  # GET /common/measure_unit_types or /common/measure_unit_types.json
  def index
    @common_measure_unit_types = Common::MeasureUnitType.all
  end

  # GET /common/measure_unit_types/1 or /common/measure_unit_types/1.json
  def show
  end

  # GET /common/measure_unit_types/new
  def new
    @common_measure_unit_type = Common::MeasureUnitType.new
  end

  # GET /common/measure_unit_types/1/edit
  def edit
  end

  # POST /common/measure_unit_types or /common/measure_unit_types.json
  def create
    @common_measure_unit_type = Common::MeasureUnitType.new(common_measure_unit_type_params)

    respond_to do |format|
      if @common_measure_unit_type.save
        format.html { redirect_to @common_measure_unit_type, notice: t('.notice') }
        format.json { render :show, status: :created, location: @common_measure_unit_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @common_measure_unit_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /common/measure_unit_types/1 or /common/measure_unit_types/1.json
  def update
    respond_to do |format|
      if @common_measure_unit_type.update(common_measure_unit_type_params)
        format.html { redirect_to @common_measure_unit_type, notice: t('.notice') }
        format.json { render :show, status: :ok, location: @common_measure_unit_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @common_measure_unit_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /common/measure_unit_types/1 or /common/measure_unit_types/1.json
  def destroy
    @common_measure_unit_type.destroy!

    respond_to do |format|
      format.html { redirect_to common_measure_unit_types_path, status: :see_other, notice: t('.notice') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_common_measure_unit_type
      @common_measure_unit_type = Common::MeasureUnitType.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def common_measure_unit_type_params
      params.expect(common_measure_unit_type: [ :name ])
    end
end
