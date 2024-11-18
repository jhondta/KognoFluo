# frozen_string_literal: true

class Common::LanguagesController < ApplicationController
  # -- -------------------------------------------------------------------------
  # -- Constants ---------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Concerns ----------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Extensions --------------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Callbacks ------------------------------------------------
  before_action :set_common_language, only: %i[ show edit update destroy ]

  # -- -------------------------------------------------------------------------
  # -- Helper methods ----------------------------------------------------------

  # -- -------------------------------------------------------------------------
  # -- Actions -----------------------------------------------------------------

  # GET /common/languages or /common/languages.json
  def index
    @common_languages = Common::Language.all
  end

  # GET /common/languages/1 or /common/languages/1.json
  def show
  end

  # GET /common/languages/new
  def new
    @common_language = Common::Language.new
  end

  # GET /common/languages/1/edit
  def edit
  end

  # POST /common/languages or /common/languages.json
  def create
    @common_language = Common::Language.new(common_language_params)

    respond_to do |format|
      if @common_language.save
        format.html { redirect_to @common_language, notice: t('.notice') }
        format.json { render :show, status: :created, location: @common_language }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @common_language.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /common/languages/1 or /common/languages/1.json
  def update
    respond_to do |format|
      if @common_language.update(common_language_params)
        format.html { redirect_to @common_language, notice: t('.notice') }
        format.json { render :show, status: :ok, location: @common_language }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @common_language.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /common/languages/1 or /common/languages/1.json
  def destroy
    @common_language.destroy!

    respond_to do |format|
      format.html { redirect_to common_languages_path, status: :see_other, notice: t('.notice') }
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
    def set_common_language
      @common_language = Common::Language.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def common_language_params
      params.expect(common_language: %i[name native_name code_iso_639_1 code_iso_639_2])
    end
end
