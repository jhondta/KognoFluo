# frozen_string_literal: true

class ProfilesController < ApplicationController
  # -- -------------------------------------------------------------------------
  # -- Constants ---------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Concerns ----------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Extensions --------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Callbacks ---------------------------------------------------------------
  before_action :set_profile, only: %i[ show edit update destroy ]

  # -- -------------------------------------------------------------------------
  # -- Helper methods ----------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Actions -----------------------------------------------------------------

  # GET /profiles or /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1 or /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles or /profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: t('.notice') }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: t('.notice') }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1 or /profiles/1.json
  def destroy
    @profile.destroy!

    respond_to do |format|
      format.html { redirect_to profiles_path, status: :see_other, notice: t('.notice') }
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
    def set_profile
      @profile = Profile.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.expect(profile: %i[user_id first_name last_name birth_date gender avatar])
    end
end
