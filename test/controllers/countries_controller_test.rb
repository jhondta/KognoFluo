# frozen_string_literal: true

require 'test_helper'

class CountriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @country = countries(:one)
  end

  test 'should get index' do
    get countries_url
    assert_response :success
  end

  test 'should get new' do
    get new_country_url
    assert_response :success
  end

  test 'should create country' do
    assert_difference('Country.count') do
      post countries_url, params: { country: { common_name: @country.common_name, flag: @country.flag, iso_code2: @country.iso_code2, iso_code3: @country.iso_code3, official_name: @country.official_name, phone_code: @country.phone_code, tld: @country.tld } }
    end

    assert_redirected_to country_url(Country.last)
  end

  test 'should show country' do
    get country_url(@country)
    assert_response :success
  end

  test 'should get edit' do
    get edit_country_url(@country)
    assert_response :success
  end

  test 'should update country' do
    patch country_url(@country), params: { country: { common_name: @country.common_name, flag: @country.flag, iso_code2: @country.iso_code2, iso_code3: @country.iso_code3, official_name: @country.official_name, phone_code: @country.phone_code, tld: @country.tld } }
    assert_redirected_to country_url(@country)
  end

  test 'should destroy country' do
    assert_difference('Country.count', -1) do
      delete country_url(@country)
    end

    assert_redirected_to countries_url
  end
end
