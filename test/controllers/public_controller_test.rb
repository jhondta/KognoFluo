# frozen_string_literal: true

require 'test_helper'

class PublicControllerTest < ActionDispatch::IntegrationTest
  test 'should get home' do
    get root_url
    assert_response :success
  end

  test 'should get help' do
    get help_url
    assert_response :success
  end

  test 'should get about' do
    get about_url
    assert_response :success
  end

  test 'should get contact' do
    get contact_url
    assert_response :success
  end
end
