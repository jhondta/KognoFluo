# frozen_string_literal: true

require 'test_helper'

class CountryCurrenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @country_currency = country_currencies(:one)
  end

  test 'should get index' do
    get country_currencies_url
    assert_response :success
  end

  test 'should get new' do
    get new_country_currency_url
    assert_response :success
  end

  test 'should create country_currency' do
    assert_difference('CountryCurrency.count') do
      post country_currencies_url, params: { country_currency: { country_id: @country_currency.country_id, currency_id: @country_currency.currency_id, is_primary: @country_currency.is_primary } }
    end

    assert_redirected_to country_currency_url(CountryCurrency.last)
  end

  test 'should show country_currency' do
    get country_currency_url(@country_currency)
    assert_response :success
  end

  test 'should get edit' do
    get edit_country_currency_url(@country_currency)
    assert_response :success
  end

  test 'should update country_currency' do
    patch country_currency_url(@country_currency), params: { country_currency: { country_id: @country_currency.country_id, currency_id: @country_currency.currency_id, is_primary: @country_currency.is_primary } }
    assert_redirected_to country_currency_url(@country_currency)
  end

  test 'should destroy country_currency' do
    assert_difference('CountryCurrency.count', -1) do
      delete country_currency_url(@country_currency)
    end

    assert_redirected_to country_currencies_url
  end
end
