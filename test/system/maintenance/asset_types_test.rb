# frozen_string_literal: true

require 'application_system_test_case'

class Maintenance::AssetTypesTest < ApplicationSystemTestCase
  setup do
    @maintenance_asset_type = maintenance_asset_types(:one)
  end

  test 'visiting the index' do
    visit maintenance_asset_types_url
    assert_selector 'h1', text: 'Asset types'
  end

  test 'should create asset type' do
    visit maintenance_asset_types_url
    click_on 'New asset type'

    check 'Active' if @maintenance_asset_type.active
    fill_in 'Code', with: @maintenance_asset_type.code
    fill_in 'Description', with: @maintenance_asset_type.description
    fill_in 'Maintenance frequency', with: @maintenance_asset_type.maintenance_frequency
    fill_in 'Name', with: @maintenance_asset_type.name
    check 'Requires calibration' if @maintenance_asset_type.requires_calibration
    click_on 'Create Asset type'

    assert_text 'Asset type was successfully created'
    click_on 'Back'
  end

  test 'should update Asset type' do
    visit maintenance_asset_type_url(@maintenance_asset_type)
    click_on 'Edit this asset type', match: :first

    check 'Active' if @maintenance_asset_type.active
    fill_in 'Code', with: @maintenance_asset_type.code
    fill_in 'Description', with: @maintenance_asset_type.description
    fill_in 'Maintenance frequency', with: @maintenance_asset_type.maintenance_frequency
    fill_in 'Name', with: @maintenance_asset_type.name
    check 'Requires calibration' if @maintenance_asset_type.requires_calibration
    click_on 'Update Asset type'

    assert_text 'Asset type was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Asset type' do
    visit maintenance_asset_type_url(@maintenance_asset_type)
    click_on 'Destroy this asset type', match: :first

    assert_text 'Asset type was successfully destroyed'
  end
end
