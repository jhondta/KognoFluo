# frozen_string_literal: true

class CountryCurrenciesController < ApplicationController
  before_action :set_country_currency, only: %i[ show edit update destroy ]

  # GET /country_currencies or /country_currencies.json
  def index
    @country_currencies = CountryCurrency.all
  end

  # GET /country_currencies/1 or /country_currencies/1.json
  def show
  end

  # GET /country_currencies/new
  def new
    @country_currency = CountryCurrency.new
  end

  # GET /country_currencies/1/edit
  def edit
  end

  # POST /country_currencies or /country_currencies.json
  def create
    @country_currency = CountryCurrency.new(country_currency_params)

    respond_to do |format|
      if @country_currency.save
        format.html { redirect_to @country_currency, notice: 'Country currency was successfully created.' }
        format.json { render :show, status: :created, location: @country_currency }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @country_currency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /country_currencies/1 or /country_currencies/1.json
  def update
    respond_to do |format|
      if @country_currency.update(country_currency_params)
        format.html { redirect_to @country_currency, notice: 'Country currency was successfully updated.' }
        format.json { render :show, status: :ok, location: @country_currency }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @country_currency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /country_currencies/1 or /country_currencies/1.json
  def destroy
    @country_currency.destroy!

    respond_to do |format|
      format.html { redirect_to country_currencies_path, status: :see_other, notice: 'Country currency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country_currency
      @country_currency = CountryCurrency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def country_currency_params
      params.require(:country_currency).permit(:country_id, :currency_id, :is_primary)
    end
end
