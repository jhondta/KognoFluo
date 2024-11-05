# frozen_string_literal: true

require 'test_helper'

class Maintenance::AssetTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maintenance_asset_type = maintenance_asset_types(:one)
  end

  test 'should get index' do
    get maintenance_asset_types_url
    assert_response :success
  end

  test 'should get new' do
    get new_maintenance_asset_type_url
    assert_response :success
  end

  test 'should create maintenance_asset_type' do
    assert_difference('Maintenance::AssetType.count') do
      post maintenance_asset_types_url, params: { maintenance_asset_type: { active: @maintenance_asset_type.active, code: @maintenance_asset_type.code, description: @maintenance_asset_type.description, maintenance_frequency: @maintenance_asset_type.maintenance_frequency, name: @maintenance_asset_type.name, requires_calibration: @maintenance_asset_type.requires_calibration } }
    end

    assert_redirected_to maintenance_asset_type_url(Maintenance::AssetType.last)
  end

  test 'should show maintenance_asset_type' do
    get maintenance_asset_type_url(@maintenance_asset_type)
    assert_response :success
  end

  test 'should get edit' do
    get edit_maintenance_asset_type_url(@maintenance_asset_type)
    assert_response :success
  end

  test 'should update maintenance_asset_type' do
    patch maintenance_asset_type_url(@maintenance_asset_type), params: { maintenance_asset_type: { active: @maintenance_asset_type.active, code: @maintenance_asset_type.code, description: @maintenance_asset_type.description, maintenance_frequency: @maintenance_asset_type.maintenance_frequency, name: @maintenance_asset_type.name, requires_calibration: @maintenance_asset_type.requires_calibration } }
    assert_redirected_to maintenance_asset_type_url(@maintenance_asset_type)
  end

  test 'should destroy maintenance_asset_type' do
    assert_difference('Maintenance::AssetType.count', -1) do
      delete maintenance_asset_type_url(@maintenance_asset_type)
    end

    assert_redirected_to maintenance_asset_types_url
  end
end
