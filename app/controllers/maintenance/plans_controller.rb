# frozen_string_literal: true

class Maintenance::PlansController < ApplicationController
  # -- -------------------------------------------------------------------------
  # -- Constants ---------------------------------------------------------------
  PERMITTED_ATTRIBUTES =
    %i[ code name description plan_type status criticality frequency_type
        frequency_value duration_hours duration_minutes requires_shutdown
        maintenance_asset_id maintenance_asset_component_id start_date ].freeze

  # -- -------------------------------------------------------------------------
  # -- Concerns ----------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Extensions --------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Callbacks ---------------------------------------------------------------
  before_action :set_maintenance_plan, only: %i[ show edit update destroy ]

  # -- -------------------------------------------------------------------------
  # -- Helper methods ----------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Actions -----------------------------------------------------------------

  # GET /maintenance/plans or /maintenance/plans.json
  def index
    @pagy, @maintenance_plans = pagy(Maintenance::Plan.all)
  end

  # GET /maintenance/plans/1 or /maintenance/plans/1.json
  def show
  end

  # GET /maintenance/plans/new
  def new
    @maintenance_plan = Maintenance::Plan.new
  end

  # GET /maintenance/plans/1/edit
  def edit
  end

  # POST /maintenance/plans or /maintenance/plans.json
  def create
    @maintenance_plan = Maintenance::Plan.new(maintenance_plan_params)

    respond_to do |format|
      if @maintenance_plan.save
        format.html { redirect_to @maintenance_plan, notice: t('.notice') }
        format.json { render :show, status: :created,
                             location: @maintenance_plan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maintenance_plan.errors,
                             status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenance/plans/1 or /maintenance/plans/1.json
  def update
    respond_to do |format|
      if @maintenance_plan.update(maintenance_plan_params)
        format.html { redirect_to @maintenance_plan, notice: t('.notice') }
        format.json { render :show, status: :ok, location: @maintenance_plan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maintenance_plan.errors,
                             status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance/plans/1 or /maintenance/plans/1.json
  def destroy
    @maintenance_plan.destroy!

    respond_to do |format|
      format.html { redirect_to maintenance_plans_path, status: :see_other,
                                notice: t('.notice') }
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
    def set_maintenance_plan
      @maintenance_plan = Maintenance::Plan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def maintenance_plan_params
      params.expect(maintenance_plan: PERMITTED_ATTRIBUTES)
    end
end
