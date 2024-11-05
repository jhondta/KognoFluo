# frozen_string_literal: true

require 'test_helper'

class Maintenance::FrequenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maintenance_frequency = maintenance_frequencies(:one)
  end

  test 'should get index' do
    get maintenance_frequencies_url
    assert_response :success
  end

  test 'should get new' do
    get new_maintenance_frequency_url
    assert_response :success
  end

  test 'should create maintenance_frequency' do
    assert_difference('Maintenance::Frequency.count') do
      post maintenance_frequencies_url, params: { maintenance_frequency: { description: @maintenance_frequency.description, name: @maintenance_frequency.name } }
    end

    assert_redirected_to maintenance_frequency_url(Maintenance::Frequency.last)
  end

  test 'should show maintenance_frequency' do
    get maintenance_frequency_url(@maintenance_frequency)
    assert_response :success
  end

  test 'should get edit' do
    get edit_maintenance_frequency_url(@maintenance_frequency)
    assert_response :success
  end

  test 'should update maintenance_frequency' do
    patch maintenance_frequency_url(@maintenance_frequency), params: { maintenance_frequency: { description: @maintenance_frequency.description, name: @maintenance_frequency.name } }
    assert_redirected_to maintenance_frequency_url(@maintenance_frequency)
  end

  test 'should destroy maintenance_frequency' do
    assert_difference('Maintenance::Frequency.count', -1) do
      delete maintenance_frequency_url(@maintenance_frequency)
    end

    assert_redirected_to maintenance_frequencies_url
  end
end
