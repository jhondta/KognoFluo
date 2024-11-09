# frozen_string_literal: true

class Maintenance::ManufacturersController < ApplicationController
  before_action :set_maintenance_manufacturer, only: %i[ show edit update destroy ]

  # GET /maintenance/manufacturers or /maintenance/manufacturers.json
  def index
    @maintenance_manufacturers = Maintenance::Manufacturer.all
  end

  # GET /maintenance/manufacturers/1 or /maintenance/manufacturers/1.json
  def show
  end

  # GET /maintenance/manufacturers/new
  def new
    @maintenance_manufacturer = Maintenance::Manufacturer.new
  end

  # GET /maintenance/manufacturers/1/edit
  def edit
  end

  # POST /maintenance/manufacturers or /maintenance/manufacturers.json
  def create
    @maintenance_manufacturer = Maintenance::Manufacturer.new(maintenance_manufacturer_params)

    respond_to do |format|
      if @maintenance_manufacturer.save
        format.html { redirect_to @maintenance_manufacturer, notice: t('.notice') }
        format.json { render :show, status: :created, location: @maintenance_manufacturer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maintenance_manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenance/manufacturers/1 or /maintenance/manufacturers/1.json
  def update
    respond_to do |format|
      if @maintenance_manufacturer.update(maintenance_manufacturer_params)
        format.html { redirect_to @maintenance_manufacturer, notice: t('.notice') }
        format.json { render :show, status: :ok, location: @maintenance_manufacturer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maintenance_manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance/manufacturers/1 or /maintenance/manufacturers/1.json
  def destroy
    @maintenance_manufacturer.destroy!

    respond_to do |format|
      format.html { redirect_to maintenance_manufacturers_path, status: :see_other, notice: t('.notice') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_manufacturer
      @maintenance_manufacturer = Maintenance::Manufacturer.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def maintenance_manufacturer_params
      params.expect(maintenance_manufacturer: %i[code name status website support_phone suport_email notes])
    end
end
