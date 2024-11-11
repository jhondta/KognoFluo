# frozen_string_literal: true

require 'application_system_test_case'

class Maintenance::AssetsTest < ApplicationSystemTestCase
  setup do
    @maintenance_asset = maintenance_assets(:one)
  end

  test 'visiting the index' do
    visit maintenance_assets_url
    assert_selector 'h1', text: 'Assets'
  end

  test 'should create asset' do
    visit maintenance_assets_url
    click_on 'New asset'

    check 'Active' if @maintenance_asset.active
    fill_in 'Code', with: @maintenance_asset.code
    fill_in 'Configuration area', with: @maintenance_asset.configuration_area_id
    fill_in 'Criticality level', with: @maintenance_asset.criticality_level
    fill_in 'Maintenance asset type', with: @maintenance_asset.maintenance_asset_type_id
    fill_in 'Maintenance manufacturer', with: @maintenance_asset.maintenance_manufacturer_id
    fill_in 'Manufacturing date', with: @maintenance_asset.manufacturing_date
    fill_in 'Model', with: @maintenance_asset.model
    fill_in 'Name', with: @maintenance_asset.name
    fill_in 'Notes', with: @maintenance_asset.notes
    fill_in 'Physical location', with: @maintenance_asset.physical_location
    fill_in 'Purchase date', with: @maintenance_asset.purchase_date
    fill_in 'Serial number', with: @maintenance_asset.serial_number
    fill_in 'Status', with: @maintenance_asset.status
    fill_in 'Technical specs', with: @maintenance_asset.technical_specs
    fill_in 'Warranty expiration', with: @maintenance_asset.warranty_expiration
    click_on 'Create Asset'

    assert_text 'Asset was successfully created'
    click_on 'Back'
  end

  test 'should update Asset' do
    visit maintenance_asset_url(@maintenance_asset)
    click_on 'Edit this asset', match: :first

    check 'Active' if @maintenance_asset.active
    fill_in 'Code', with: @maintenance_asset.code
    fill_in 'Configuration area', with: @maintenance_asset.configuration_area_id
    fill_in 'Criticality level', with: @maintenance_asset.criticality_level
    fill_in 'Maintenance asset type', with: @maintenance_asset.maintenance_asset_type_id
    fill_in 'Maintenance manufacturer', with: @maintenance_asset.maintenance_manufacturer_id
    fill_in 'Manufacturing date', with: @maintenance_asset.manufacturing_date
    fill_in 'Model', with: @maintenance_asset.model
    fill_in 'Name', with: @maintenance_asset.name
    fill_in 'Notes', with: @maintenance_asset.notes
    fill_in 'Physical location', with: @maintenance_asset.physical_location
    fill_in 'Purchase date', with: @maintenance_asset.purchase_date
    fill_in 'Serial number', with: @maintenance_asset.serial_number
    fill_in 'Status', with: @maintenance_asset.status
    fill_in 'Technical specs', with: @maintenance_asset.technical_specs
    fill_in 'Warranty expiration', with: @maintenance_asset.warranty_expiration
    click_on 'Update Asset'

    assert_text 'Asset was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Asset' do
    visit maintenance_asset_url(@maintenance_asset)
    click_on 'Destroy this asset', match: :first

    assert_text 'Asset was successfully destroyed'
  end
end
