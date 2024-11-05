# frozen_string_literal: true

require 'test_helper'

class Maintenance::AssetAssigneesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maintenance_asset_assignee = maintenance_asset_assignees(:one)
  end

  test 'should get index' do
    get maintenance_asset_assignees_url
    assert_response :success
  end

  test 'should get new' do
    get new_maintenance_asset_assignee_url
    assert_response :success
  end

  test 'should create maintenance_asset_assignee' do
    assert_difference('Maintenance::AssetAssignee.count') do
      post maintenance_asset_assignees_url, params: { maintenance_asset_assignee: { maintenance_asset_id: @maintenance_asset_assignee.maintenance_asset_id, maintenance_technician_id: @maintenance_asset_assignee.maintenance_technician_id } }
    end

    assert_redirected_to maintenance_asset_assignee_url(Maintenance::AssetAssignee.last)
  end

  test 'should show maintenance_asset_assignee' do
    get maintenance_asset_assignee_url(@maintenance_asset_assignee)
    assert_response :success
  end

  test 'should get edit' do
    get edit_maintenance_asset_assignee_url(@maintenance_asset_assignee)
    assert_response :success
  end

  test 'should update maintenance_asset_assignee' do
    patch maintenance_asset_assignee_url(@maintenance_asset_assignee), params: { maintenance_asset_assignee: { maintenance_asset_id: @maintenance_asset_assignee.maintenance_asset_id, maintenance_technician_id: @maintenance_asset_assignee.maintenance_technician_id } }
    assert_redirected_to maintenance_asset_assignee_url(@maintenance_asset_assignee)
  end

  test 'should destroy maintenance_asset_assignee' do
    assert_difference('Maintenance::AssetAssignee.count', -1) do
      delete maintenance_asset_assignee_url(@maintenance_asset_assignee)
    end

    assert_redirected_to maintenance_asset_assignees_url
  end
end
