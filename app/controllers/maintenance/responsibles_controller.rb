# frozen_string_literal: true

class Maintenance::ResponsiblesController < ApplicationController
  before_action :set_maintenance_responsible, only: %i[ show edit update destroy ]

  # GET /maintenance/responsibles or /maintenance/responsibles.json
  def index
    @maintenance_responsibles = Maintenance::Responsible.all
  end

  # GET /maintenance/responsibles/1 or /maintenance/responsibles/1.json
  def show
  end

  # GET /maintenance/responsibles/new
  def new
    @maintenance_responsible = Maintenance::Responsible.new
  end

  # GET /maintenance/responsibles/1/edit
  def edit
  end

  # POST /maintenance/responsibles or /maintenance/responsibles.json
  def create
    @maintenance_responsible = Maintenance::Responsible.new(maintenance_responsible_params)

    respond_to do |format|
      if @maintenance_responsible.save
        format.html { redirect_to @maintenance_responsible, notice: 'Responsible was successfully created.' }
        format.json { render :show, status: :created, location: @maintenance_responsible }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maintenance_responsible.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenance/responsibles/1 or /maintenance/responsibles/1.json
  def update
    respond_to do |format|
      if @maintenance_responsible.update(maintenance_responsible_params)
        format.html { redirect_to @maintenance_responsible, notice: 'Responsible was successfully updated.' }
        format.json { render :show, status: :ok, location: @maintenance_responsible }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maintenance_responsible.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance/responsibles/1 or /maintenance/responsibles/1.json
  def destroy
    @maintenance_responsible.destroy!

    respond_to do |format|
      format.html { redirect_to maintenance_responsibles_path, status: :see_other, notice: 'Responsible was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_responsible
      @maintenance_responsible = Maintenance::Responsible.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def maintenance_responsible_params
      params.require(:maintenance_responsible).permit(:user_id, :speciality, :status)
    end
end
