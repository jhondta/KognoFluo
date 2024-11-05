# frozen_string_literal: true

require 'test_helper'

class Organization::AreasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization_area = create(:organization_area)
  end

  test 'should get index' do
    get organization_areas_url
    assert_response :success
  end

  test 'should get new' do
    get new_organization_area_url
    assert_response :success
  end

  test 'should create organization_area' do
    assert_difference('Organization::Area.count') do
      post organization_areas_url, params: { organization_area: { code: @organization_area.code, description: @organization_area.description, name: @organization_area.name, organization_plant_id: @organization_area.organization_plant_id, status: @organization_area.status } }
    end

    assert_redirected_to organization_area_url(Organization::Area.last)
  end

  test 'should show organization_area' do
    get organization_area_url(@organization_area)
    assert_response :success
  end

  test 'should get edit' do
    get edit_organization_area_url(@organization_area)
    assert_response :success
  end

  test 'should update organization_area' do
    patch organization_area_url(@organization_area), params: { organization_area: { code: @organization_area.code, description: @organization_area.description, name: @organization_area.name, organization_plant_id: @organization_area.organization_plant_id, status: @organization_area.status } }
    assert_redirected_to organization_area_url(@organization_area)
  end

  test 'should destroy organization_area' do
    assert_difference('Organization::Area.count', -1) do
      delete organization_area_url(@organization_area)
    end

    assert_redirected_to organization_areas_url
  end
end
