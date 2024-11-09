# frozen_string_literal: true

class Organization::ProductionLinesController < ApplicationController
  before_action :set_organization_production_line, only: %i[ show edit update destroy ]

  # GET /organization/production_lines or /organization/production_lines.json
  def index
    @organization_production_lines = Organization::ProductionLine.all
  end

  # GET /organization/production_lines/1 or /organization/production_lines/1.json
  def show
  end

  # GET /organization/production_lines/new
  def new
    @organization_production_line = Organization::ProductionLine.new
  end

  # GET /organization/production_lines/1/edit
  def edit
  end

  # POST /organization/production_lines or /organization/production_lines.json
  def create
    @organization_production_line = Organization::ProductionLine.new(organization_production_line_params)

    respond_to do |format|
      if @organization_production_line.save
        format.html { redirect_to @organization_production_line, notice: t('.notice') }
        format.json { render :show, status: :created, location: @organization_production_line }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @organization_production_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organization/production_lines/1 or /organization/production_lines/1.json
  def update
    respond_to do |format|
      if @organization_production_line.update(organization_production_line_params)
        format.html { redirect_to @organization_production_line, notice: t('.notice') }
        format.json { render :show, status: :ok, location: @organization_production_line }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organization_production_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organization/production_lines/1 or /organization/production_lines/1.json
  def destroy
    @organization_production_line.destroy!

    respond_to do |format|
      format.html { redirect_to organization_production_lines_path, status: :see_other, notice: t('.notice') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization_production_line
      @organization_production_line = Organization::ProductionLine.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def organization_production_line_params
      params.expect(organization_production_line: %i[code name description organization_producion_line_id status])
    end
end
