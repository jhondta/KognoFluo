# frozen_string_literal: true

require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'should get show when authenticated' do
    sign_in users(:one)
    get authenticated_root_url
    assert_response :success
    assert_template :show
  end

  test 'should redirect to login when not authenticated' do
    get authenticated_root_url
    assert_response :success
    assert_template 'public/home'
  end
end
