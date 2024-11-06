# frozen_string_literal: true

class Maintenance::PlansController < ApplicationController
  before_action :set_maintenance_plan, only: %i[ show edit update destroy ]

  # GET /maintenance/plans or /maintenance/plans.json
  def index
    @maintenance_plans = Maintenance::Plan.all
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
        format.html { redirect_to @maintenance_plan, notice: 'Plan was successfully created.' }
        format.json { render :show, status: :created, location: @maintenance_plan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maintenance_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenance/plans/1 or /maintenance/plans/1.json
  def update
    respond_to do |format|
      if @maintenance_plan.update(maintenance_plan_params)
        format.html { redirect_to @maintenance_plan, notice: 'Plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @maintenance_plan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maintenance_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance/plans/1 or /maintenance/plans/1.json
  def destroy
    @maintenance_plan.destroy!

    respond_to do |format|
      format.html { redirect_to maintenance_plans_path, status: :see_other, notice: 'Plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_plan
      @maintenance_plan = Maintenance::Plan.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def maintenance_plan_params
      params.expect(maintenance_plan: %i[maintenance_plan_template_id maintenace_asset_id component_id status start_date last_execution_date next_execution_date notes])
    end
end
