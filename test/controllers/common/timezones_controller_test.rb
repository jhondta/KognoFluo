# frozen_string_literal: true

require 'test_helper'

class Common::TimezonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @common_timezone = create(:common_timezone)
    sign_in shared_user
  end

  test 'should get index' do
    get common_timezones_url
    assert_response :success
  end

  test 'should get new' do
    get new_common_timezone_url
    assert_response :success
  end

  test 'should create common_timezone' do
    assert_difference('Common::Timezone.count') do
      post common_timezones_url, params: { common_timezone: { gmt_offset: @common_timezone.gmt_offset, name: @common_timezone.name } }
    end

    assert_redirected_to common_timezone_url(Common::Timezone.last)
  end

  test 'should show common_timezone' do
    get common_timezone_url(@common_timezone)
    assert_response :success
  end

  test 'should get edit' do
    get edit_common_timezone_url(@common_timezone)
    assert_response :success
  end

  test 'should update common_timezone' do
    patch common_timezone_url(@common_timezone), params: { common_timezone: { gmt_offset: @common_timezone.gmt_offset, name: @common_timezone.name } }
    assert_redirected_to common_timezone_url(@common_timezone)
  end

  test 'should destroy common_timezone' do
    assert_difference('Common::Timezone.count', -1) do
      delete common_timezone_url(@common_timezone)
    end

    assert_redirected_to common_timezones_url
  end
end
