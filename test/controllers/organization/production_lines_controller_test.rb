# frozen_string_literal: true

require 'test_helper'

class Organization::ProductionLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization_production_line = create(:organization_production_line)
    sign_in shared_user
  end

  test 'should get index' do
    get organization_production_lines_url
    assert_response :success
  end

  test 'should get new' do
    get new_organization_production_line_url
    assert_response :success
  end

  test 'should create organization_production_line' do
    assert_difference('Organization::ProductionLine.count') do
      post organization_production_lines_url, params: { organization_production_line: { code: @organization_production_line.code, configuration_area_id: @organization_production_line.configuration_area_id, description: @organization_production_line.description, name: @organization_production_line.name, status: @organization_production_line.status } }
    end

    assert_redirected_to organization_production_line_url(Organization::ProductionLine.last)
  end

  test 'should show organization_production_line' do
    get organization_production_line_url(@organization_production_line)
    assert_response :success
  end

  test 'should get edit' do
    get edit_organization_production_line_url(@organization_production_line)
    assert_response :success
  end

  test 'should update organization_production_line' do
    patch organization_production_line_url(@organization_production_line), params: { organization_production_line: { code: @organization_production_line.code, configuration_area_id: @organization_production_line.configuration_area_id, description: @organization_production_line.description, name: @organization_production_line.name, status: @organization_production_line.status } }
    assert_redirected_to organization_production_line_url(@organization_production_line)
  end

  test 'should destroy organization_production_line' do
    assert_difference('Organization::ProductionLine.count', -1) do
      delete organization_production_line_url(@organization_production_line)
    end

    assert_redirected_to organization_production_lines_url
  end
end
