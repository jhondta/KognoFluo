# frozen_string_literal: true

class CountryTimezonesController < ApplicationController
  before_action :set_country_timezone, only: %i[ show edit update destroy ]

  # GET /country_timezones or /country_timezones.json
  def index
    @country_timezones = CountryTimezone.all
  end

  # GET /country_timezones/1 or /country_timezones/1.json
  def show
  end

  # GET /country_timezones/new
  def new
    @country_timezone = CountryTimezone.new
  end

  # GET /country_timezones/1/edit
  def edit
  end

  # POST /country_timezones or /country_timezones.json
  def create
    @country_timezone = CountryTimezone.new(country_timezone_params)

    respond_to do |format|
      if @country_timezone.save
        format.html { redirect_to @country_timezone, notice: 'Country timezone was successfully created.' }
        format.json { render :show, status: :created, location: @country_timezone }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @country_timezone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /country_timezones/1 or /country_timezones/1.json
  def update
    respond_to do |format|
      if @country_timezone.update(country_timezone_params)
        format.html { redirect_to @country_timezone, notice: 'Country timezone was successfully updated.' }
        format.json { render :show, status: :ok, location: @country_timezone }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @country_timezone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /country_timezones/1 or /country_timezones/1.json
  def destroy
    @country_timezone.destroy!

    respond_to do |format|
      format.html { redirect_to country_timezones_path, status: :see_other, notice: 'Country timezone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country_timezone
      @country_timezone = CountryTimezone.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def country_timezone_params
      params.require(:country_timezone).permit(:country_id, :timezones_id, :is_primary)
    end
end
