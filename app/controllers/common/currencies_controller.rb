# frozen_string_literal: true

class Common::CurrenciesController < ApplicationController
  before_action :set_common_currency, only: %i[ show edit update destroy ]

  # GET /common/currencies or /common/currencies.json
  def index
    @common_currencies = Common::Currency.all
  end

  # GET /common/currencies/1 or /common/currencies/1.json
  def show
  end

  # GET /common/currencies/new
  def new
    @common_currency = Common::Currency.new
  end

  # GET /common/currencies/1/edit
  def edit
  end

  # POST /common/currencies or /common/currencies.json
  def create
    @common_currency = Common::Currency.new(common_currency_params)

    respond_to do |format|
      if @common_currency.save
        format.html { redirect_to @common_currency, notice: 'Currency was successfully created.' }
        format.json { render :show, status: :created, location: @common_currency }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @common_currency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /common/currencies/1 or /common/currencies/1.json
  def update
    respond_to do |format|
      if @common_currency.update(common_currency_params)
        format.html { redirect_to @common_currency, notice: 'Currency was successfully updated.' }
        format.json { render :show, status: :ok, location: @common_currency }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @common_currency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /common/currencies/1 or /common/currencies/1.json
  def destroy
    @common_currency.destroy!

    respond_to do |format|
      format.html { redirect_to common_currencies_path, status: :see_other, notice: 'Currency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_common_currency
      @common_currency = Common::Currency.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def common_currency_params
      params.expect(common_currency: %i[name code_alpha code_numeric symbol])
    end
end
