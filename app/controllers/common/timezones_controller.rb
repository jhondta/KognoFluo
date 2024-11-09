# frozen_string_literal: true

class Common::TimezonesController < ApplicationController
  before_action :set_common_timezone, only: %i[ show edit update destroy ]

  # GET /common/timezones or /common/timezones.json
  def index
    @common_timezones = Common::Timezone.all
  end

  # GET /common/timezones/1 or /common/timezones/1.json
  def show
  end

  # GET /common/timezones/new
  def new
    @common_timezone = Common::Timezone.new
  end

  # GET /common/timezones/1/edit
  def edit
  end

  # POST /common/timezones or /common/timezones.json
  def create
    @common_timezone = Common::Timezone.new(common_timezone_params)

    respond_to do |format|
      if @common_timezone.save
        format.html { redirect_to @common_timezone, notice: t('.notice') }
        format.json { render :show, status: :created, location: @common_timezone }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @common_timezone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /common/timezones/1 or /common/timezones/1.json
  def update
    respond_to do |format|
      if @common_timezone.update(common_timezone_params)
        format.html { redirect_to @common_timezone, notice: t('.notice') }
        format.json { render :show, status: :ok, location: @common_timezone }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @common_timezone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /common/timezones/1 or /common/timezones/1.json
  def destroy
    @common_timezone.destroy!

    respond_to do |format|
      format.html { redirect_to common_timezones_path, status: :see_other, notice: t('.notice') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_common_timezone
      @common_timezone = Common::Timezone.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def common_timezone_params
      params.expect(common_timezone: %i[name gmt_offset])
    end
end
