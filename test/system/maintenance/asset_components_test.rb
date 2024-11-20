# frozen_string_literal: true

require 'application_system_test_case'

class Maintenance::AssetComponentsTest < ApplicationSystemTestCase
  setup do
    @maintenance_asset_component = create(:maintenance_asset_component)
  end

  test 'visiting the index' do
    visit maintenance_asset_components_url
    assert_selector 'h1', text: 'Asset components'
  end

  test 'should create asset component' do
    visit maintenance_asset_components_url
    click_on 'New asset component'

    check 'Active' if @maintenance_asset_component.active
    fill_in 'Description', with: @maintenance_asset_component.description
    fill_in 'Maintenance asset', with: @maintenance_asset_component.maintenance_asset_id
    fill_in 'Name', with: @maintenance_asset_component.name
    fill_in 'Quantity', with: @maintenance_asset_component.quantity
    fill_in 'Replacement period', with: @maintenance_asset_component.replacement_period
    fill_in 'Specifications', with: @maintenance_asset_component.specifications
    click_on 'Create Asset component'

    assert_text 'Asset component was successfully created'
    click_on 'Back'
  end

  test 'should update Asset component' do
    visit maintenance_asset_component_url(@maintenance_asset_component)
    click_on 'Edit this asset component', match: :first

    check 'Active' if @maintenance_asset_component.active
    fill_in 'Description', with: @maintenance_asset_component.description
    fill_in 'Maintenance asset', with: @maintenance_asset_component.maintenance_asset_id
    fill_in 'Name', with: @maintenance_asset_component.name
    fill_in 'Quantity', with: @maintenance_asset_component.quantity
    fill_in 'Replacement period', with: @maintenance_asset_component.replacement_period
    fill_in 'Specifications', with: @maintenance_asset_component.specifications
    click_on 'Update Asset component'

    assert_text 'Asset component was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Asset component' do
    visit maintenance_asset_component_url(@maintenance_asset_component)
    click_on 'Destroy this asset component', match: :first

    assert_text 'Asset component was successfully destroyed'
  end
end
