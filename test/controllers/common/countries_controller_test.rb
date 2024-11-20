# frozen_string_literal: true

require 'test_helper'

class Common::CountriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @common_country = create(:common_country)
    sign_in shared_user
  end

  test 'should get index' do
    get common_countries_url
    assert_response :success
  end

  test 'should get new' do
    get new_common_country_url
    assert_response :success
  end

  test 'should create common_country' do
    assert_difference('Common::Country.count') do
      post common_countries_url, params: { common_country: { code_alpha2: @common_country.code_alpha2, code_alpha3: @common_country.code_alpha3, common_name: @common_country.common_name, flag_png: @common_country.flag_png, flag_svg: @common_country.flag_svg, official_name: @common_country.official_name, phone_code: @common_country.phone_code, tld: @common_country.tld } }
    end

    assert_redirected_to common_country_url(Common::Country.last)
  end

  test 'should show common_country' do
    get common_country_url(@common_country)
    assert_response :success
  end

  test 'should get edit' do
    get edit_common_country_url(@common_country)
    assert_response :success
  end

  test 'should update common_country' do
    patch common_country_url(@common_country), params: { common_country: { code_alpha2: @common_country.code_alpha2, code_alpha3: @common_country.code_alpha3, common_name: @common_country.common_name, flag_png: @common_country.flag_png, flag_svg: @common_country.flag_svg, official_name: @common_country.official_name, phone_code: @common_country.phone_code, tld: @common_country.tld } }
    assert_redirected_to common_country_url(@common_country)
  end

  test 'should destroy common_country' do
    assert_difference('Common::Country.count', -1) do
      delete common_country_url(@common_country)
    end

    assert_redirected_to common_countries_url
  end
end
