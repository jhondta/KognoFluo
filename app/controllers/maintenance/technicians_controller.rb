# frozen_string_literal: true

class Maintenance::TechniciansController < ApplicationController
  # -- -------------------------------------------------------------------------
  # -- Constants ---------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Concerns ----------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Extensions --------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Callbacks ---------------------------------------------------------------
  before_action :set_maintenance_technician, only: %i[ show edit update destroy ]

  # -- -------------------------------------------------------------------------
  # -- Helper methods ----------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Actions -----------------------------------------------------------------

  # GET /maintenance/technicians or /maintenance/technicians.json
  def index
    @pagy, @records = pagy(Maintenance::Technician.all)
  end

  # GET /maintenance/technicians/1 or /maintenance/technicians/1.json
  def show
  end

  # GET /maintenance/technicians/new
  def new
    @maintenance_technician = Maintenance::Technician.new
  end

  # GET /maintenance/technicians/1/edit
  def edit
  end

  # POST /maintenance/technicians or /maintenance/technicians.json
  def create
    @maintenance_technician = Maintenance::Technician.new(maintenance_technician_params)

    respond_to do |format|
      if @maintenance_technician.save
        format.html { redirect_to @maintenance_technician, notice: t('.notice') }
        format.json { render :show, status: :created, location: @maintenance_technician }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maintenance_technician.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenance/technicians/1 or /maintenance/technicians/1.json
  def update
    respond_to do |format|
      if @maintenance_technician.update(maintenance_technician_params)
        format.html { redirect_to @maintenance_technician, notice: t('.notice') }
        format.json { render :show, status: :ok, location: @maintenance_technician }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maintenance_technician.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance/technicians/1 or /maintenance/technicians/1.json
  def destroy
    @maintenance_technician.destroy!

    respond_to do |format|
      format.html { redirect_to maintenance_technicians_path, status: :see_other, notice: t('.notice') }
      format.json { head :no_content }
    end
  end

  # -- -------------------------------------------------------------------------
  # -- Protected Methods -------------------------------------------------------

  protected

  # -- -------------------------------------------------------------------------
  # -- Private Methods ---------------------------------------------------------

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_technician
      @maintenance_technician = Maintenance::Technician.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def maintenance_technician_params
      params.expect(maintenance_technician: %i[user_id specialty certification_level status])
    end
end
