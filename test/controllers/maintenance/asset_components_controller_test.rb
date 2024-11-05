# frozen_string_literal: true

require 'test_helper'

class Maintenance::AssetComponentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maintenance_asset_component = maintenance_asset_components(:one)
  end

  test 'should get index' do
    get maintenance_asset_components_url
    assert_response :success
  end

  test 'should get new' do
    get new_maintenance_asset_component_url
    assert_response :success
  end

  test 'should create maintenance_asset_component' do
    assert_difference('Maintenance::AssetComponent.count') do
      post maintenance_asset_components_url, params: { maintenance_asset_component: { active: @maintenance_asset_component.active, description: @maintenance_asset_component.description, maintenance_asset_id: @maintenance_asset_component.maintenance_asset_id, name: @maintenance_asset_component.name, quantity: @maintenance_asset_component.quantity, replacement_period: @maintenance_asset_component.replacement_period, specifications: @maintenance_asset_component.specifications } }
    end

    assert_redirected_to maintenance_asset_component_url(Maintenance::AssetComponent.last)
  end

  test 'should show maintenance_asset_component' do
    get maintenance_asset_component_url(@maintenance_asset_component)
    assert_response :success
  end

  test 'should get edit' do
    get edit_maintenance_asset_component_url(@maintenance_asset_component)
    assert_response :success
  end

  test 'should update maintenance_asset_component' do
    patch maintenance_asset_component_url(@maintenance_asset_component), params: { maintenance_asset_component: { active: @maintenance_asset_component.active, description: @maintenance_asset_component.description, maintenance_asset_id: @maintenance_asset_component.maintenance_asset_id, name: @maintenance_asset_component.name, quantity: @maintenance_asset_component.quantity, replacement_period: @maintenance_asset_component.replacement_period, specifications: @maintenance_asset_component.specifications } }
    assert_redirected_to maintenance_asset_component_url(@maintenance_asset_component)
  end

  test 'should destroy maintenance_asset_component' do
    assert_difference('Maintenance::AssetComponent.count', -1) do
      delete maintenance_asset_component_url(@maintenance_asset_component)
    end

    assert_redirected_to maintenance_asset_components_url
  end
end
