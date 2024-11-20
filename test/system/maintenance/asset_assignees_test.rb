# frozen_string_literal: true

require 'application_system_test_case'

class Maintenance::AssetAssigneesTest < ApplicationSystemTestCase
  setup do
    @maintenance_asset_assignee = create(:maintenance_asset_assignee)
  end

  test 'visiting the index' do
    visit maintenance_asset_assignees_url
    assert_selector 'h1', text: 'Asset assignees'
  end

  test 'should create asset assignee' do
    visit maintenance_asset_assignees_url
    click_on 'New asset assignee'

    fill_in 'Maintenance asset', with: @maintenance_asset_assignee.maintenance_asset_id
    fill_in 'Maintenance technician', with: @maintenance_asset_assignee.maintenance_technician_id
    click_on 'Create Asset assignee'

    assert_text 'Asset assignee was successfully created'
    click_on 'Back'
  end

  test 'should update Asset assignee' do
    visit maintenance_asset_assignee_url(@maintenance_asset_assignee)
    click_on 'Edit this asset assignee', match: :first

    fill_in 'Maintenance asset', with: @maintenance_asset_assignee.maintenance_asset_id
    fill_in 'Maintenance technician', with: @maintenance_asset_assignee.maintenance_technician_id
    click_on 'Update Asset assignee'

    assert_text 'Asset assignee was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Asset assignee' do
    visit maintenance_asset_assignee_url(@maintenance_asset_assignee)
    click_on 'Destroy this asset assignee', match: :first

    assert_text 'Asset assignee was successfully destroyed'
  end
end
