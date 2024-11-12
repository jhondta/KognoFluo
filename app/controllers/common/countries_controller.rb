# frozen_string_literal: true

class Common::CountriesController < ApplicationController
  before_action :set_common_country, only: %i[ show edit update destroy ]

  # GET /common/countries or /common/countries.json
  def index
    @pagy, @records = pagy(Common::Country.all)
  end

  # GET /common/countries/1 or /common/countries/1.json
  def show
  end

  # GET /common/countries/new
  def new
    @common_country = Common::Country.new
  end

  # GET /common/countries/1/edit
  def edit
  end

  # POST /common/countries or /common/countries.json
  def create
    @common_country = Common::Country.new(common_country_params)

    respond_to do |format|
      if @common_country.save
        format.html { redirect_to @common_country, success: t('.notice') }
        format.json { render :show, status: :created, location: @common_country }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @common_country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /common/countries/1 or /common/countries/1.json
  def update
    respond_to do |format|
      if @common_country.update(common_country_params)
        format.html { redirect_to @common_country, notice: t('.notice') }
        format.json { render :show, status: :ok, location: @common_country }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @common_country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /common/countries/1 or /common/countries/1.json
  def destroy
    @common_country.destroy!

    respond_to do |format|
      format.html { redirect_to common_countries_path, status: :see_other,
                                notice: t('.notice') }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_common_country
      @common_country = Common::Country.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def common_country_params
      params.expect(common_country: %i[common_name official_name code_alpha2 code_alpha3 phone_code tld flag_svg flag_png])
    end
end
