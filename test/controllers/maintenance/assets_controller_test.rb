# frozen_string_literal: true

require 'test_helper'

class Maintenance::AssetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maintenance_asset = create(:maintenance_asset)
    sign_in shared_user
  end

  test 'should get index' do
    get maintenance_assets_url
    assert_response :success
  end

  test 'should get new' do
    get new_maintenance_asset_url
    assert_response :success
  end

  test 'should create maintenance_asset' do
    assert_difference('Maintenance::Asset.count') do
      post maintenance_assets_url, params: { maintenance_asset: { active: @maintenance_asset.active, code: @maintenance_asset.code, configuration_area_id: @maintenance_asset.configuration_area_id, criticality_level: @maintenance_asset.criticality_level, maintenance_asset_type_id: @maintenance_asset.maintenance_asset_type_id, maintenance_manufacturer_id: @maintenance_asset.maintenance_manufacturer_id, manufacturing_date: @maintenance_asset.manufacturing_date, model: @maintenance_asset.model, name: @maintenance_asset.name, notes: @maintenance_asset.notes, physical_location: @maintenance_asset.physical_location, purchase_date: @maintenance_asset.purchase_date, serial_number: @maintenance_asset.serial_number, status: @maintenance_asset.status, technical_specs: @maintenance_asset.technical_specs, warranty_expiration: @maintenance_asset.warranty_expiration } }
    end

    assert_redirected_to maintenance_asset_url(Maintenance::Asset.last)
  end

  test 'should show maintenance_asset' do
    get maintenance_asset_url(@maintenance_asset)
    assert_response :success
  end

  test 'should get edit' do
    get edit_maintenance_asset_url(@maintenance_asset)
    assert_response :success
  end

  test 'should update maintenance_asset' do
    patch maintenance_asset_url(@maintenance_asset), params: { maintenance_asset: { active: @maintenance_asset.active, code: @maintenance_asset.code, configuration_area_id: @maintenance_asset.configuration_area_id, criticality_level: @maintenance_asset.criticality_level, maintenance_asset_type_id: @maintenance_asset.maintenance_asset_type_id, maintenance_manufacturer_id: @maintenance_asset.maintenance_manufacturer_id, manufacturing_date: @maintenance_asset.manufacturing_date, model: @maintenance_asset.model, name: @maintenance_asset.name, notes: @maintenance_asset.notes, physical_location: @maintenance_asset.physical_location, purchase_date: @maintenance_asset.purchase_date, serial_number: @maintenance_asset.serial_number, status: @maintenance_asset.status, technical_specs: @maintenance_asset.technical_specs, warranty_expiration: @maintenance_asset.warranty_expiration } }
    assert_redirected_to maintenance_asset_url(@maintenance_asset)
  end

  test 'should destroy maintenance_asset' do
    assert_difference('Maintenance::Asset.count', -1) do
      delete maintenance_asset_url(@maintenance_asset)
    end

    assert_redirected_to maintenance_assets_url
  end
end
