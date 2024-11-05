# frozen_string_literal: true

require 'test_helper'

class Common::CurrenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @common_currency = create(:common_currency)
  end

  test 'should get index' do
    get common_currencies_url
    assert_response :success
  end

  test 'should get new' do
    get new_common_currency_url
    assert_response :success
  end

  test 'should create common_currency' do
    assert_difference('Common::Currency.count') do
      post common_currencies_url, params: { common_currency: { code_alpha: @common_currency.code_alpha, code_numeric: @common_currency.code_numeric, name: @common_currency.name, symbol: @common_currency.symbol } }
    end

    assert_redirected_to common_currency_url(Common::Currency.last)
  end

  test 'should show common_currency' do
    get common_currency_url(@common_currency)
    assert_response :success
  end

  test 'should get edit' do
    get edit_common_currency_url(@common_currency)
    assert_response :success
  end

  test 'should update common_currency' do
    patch common_currency_url(@common_currency), params: { common_currency: { code_alpha: @common_currency.code_alpha, code_numeric: @common_currency.code_numeric, name: @common_currency.name, symbol: @common_currency.symbol } }
    assert_redirected_to common_currency_url(@common_currency)
  end

  test 'should destroy common_currency' do
    assert_difference('Common::Currency.count', -1) do
      delete common_currency_url(@common_currency)
    end

    assert_redirected_to common_currencies_url
  end
end
