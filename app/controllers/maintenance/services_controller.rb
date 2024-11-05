# frozen_string_literal: true

class Maintenance::ServicesController < ApplicationController
  before_action :set_maintenance_service, only: %i[ show edit update destroy ]

  # GET /maintenance/services or /maintenance/services.json
  def index
    @pagy, @records = pagy(Maintenance::Service.all)
  end

  # GET /maintenance/services/1 or /maintenance/services/1.json
  def show
  end

  # GET /maintenance/services/new
  def new
    @maintenance_service = Maintenance::Service.new
  end

  # GET /maintenance/services/1/edit
  def edit
  end

  # POST /maintenance/services or /maintenance/services.json
  def create
    @maintenance_service = Maintenance::Service.new(maintenance_service_params)

    respond_to do |format|
      if @maintenance_service.save
        format.html { redirect_to maintenance_services_path,
                                  notice: 'Servicio creado.' }
        format.json { render :show, status: :created, location: @maintenance_service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maintenance_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenance/services/1 or /maintenance/services/1.json
  def update
    respond_to do |format|
      if @maintenance_service.update(maintenance_service_params)
        format.html { redirect_to @maintenance_service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @maintenance_service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maintenance_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance/services/1 or /maintenance/services/1.json
  def destroy
    @maintenance_service.destroy!

    respond_to do |format|
      format.html { redirect_to maintenance_services_path, status: :see_other, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_service
      @maintenance_service = Maintenance::Service.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def maintenance_service_params
      permitted_params = %i[name description scheduled_date
                            maintenance_frequency_id maintenance_responsible_id
                            status resources]
      params.require(:maintenance_service).permit(permitted_params)
    end
end
