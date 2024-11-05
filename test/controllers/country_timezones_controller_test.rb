# frozen_string_literal: true

require 'test_helper'

class CountryTimezonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @country_timezone = country_timezones(:one)
  end

  test 'should get index' do
    get country_timezones_url
    assert_response :success
  end

  test 'should get new' do
    get new_country_timezone_url
    assert_response :success
  end

  test 'should create country_timezone' do
    assert_difference('CountryTimezone.count') do
      post country_timezones_url, params: { country_timezone: { country_id: @country_timezone.country_id, is_primary: @country_timezone.is_primary, timezones_id: @country_timezone.timezones_id } }
    end

    assert_redirected_to country_timezone_url(CountryTimezone.last)
  end

  test 'should show country_timezone' do
    get country_timezone_url(@country_timezone)
    assert_response :success
  end

  test 'should get edit' do
    get edit_country_timezone_url(@country_timezone)
    assert_response :success
  end

  test 'should update country_timezone' do
    patch country_timezone_url(@country_timezone), params: { country_timezone: { country_id: @country_timezone.country_id, is_primary: @country_timezone.is_primary, timezones_id: @country_timezone.timezones_id } }
    assert_redirected_to country_timezone_url(@country_timezone)
  end

  test 'should destroy country_timezone' do
    assert_difference('CountryTimezone.count', -1) do
      delete country_timezone_url(@country_timezone)
    end

    assert_redirected_to country_timezones_url
  end
end
