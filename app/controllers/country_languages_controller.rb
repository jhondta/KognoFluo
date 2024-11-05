# frozen_string_literal: true

class CountryLanguagesController < ApplicationController
  before_action :set_country_language, only: %i[ show edit update destroy ]

  # GET /country_languages or /country_languages.json
  def index
    @country_languages = CountryLanguage.all
  end

  # GET /country_languages/1 or /country_languages/1.json
  def show
  end

  # GET /country_languages/new
  def new
    @country_language = CountryLanguage.new
  end

  # GET /country_languages/1/edit
  def edit
  end

  # POST /country_languages or /country_languages.json
  def create
    @country_language = CountryLanguage.new(country_language_params)

    respond_to do |format|
      if @country_language.save
        format.html { redirect_to @country_language, notice: 'Country language was successfully created.' }
        format.json { render :show, status: :created, location: @country_language }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @country_language.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /country_languages/1 or /country_languages/1.json
  def update
    respond_to do |format|
      if @country_language.update(country_language_params)
        format.html { redirect_to @country_language, notice: 'Country language was successfully updated.' }
        format.json { render :show, status: :ok, location: @country_language }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @country_language.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /country_languages/1 or /country_languages/1.json
  def destroy
    @country_language.destroy!

    respond_to do |format|
      format.html { redirect_to country_languages_path, status: :see_other, notice: 'Country language was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country_language
      @country_language = CountryLanguage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def country_language_params
      params.require(:country_language).permit(:country_id, :language_id, :is_primary)
    end
end
