# frozen_string_literal: true

require 'test_helper'

class Configuration::ProductionLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @configuration_production_line = configuration_production_lines(:one)
  end

  test 'should get index' do
    get configuration_production_lines_url
    assert_response :success
  end

  test 'should get new' do
    get new_configuration_production_line_url
    assert_response :success
  end

  test 'should create configuration_production_line' do
    assert_difference('Configuration::ProductionLine.count') do
      post configuration_production_lines_url, params: { configuration_production_line: { active: @configuration_production_line.active, code: @configuration_production_line.code, configuration_area_id: @configuration_production_line.configuration_area_id, description: @configuration_production_line.description, name: @configuration_production_line.name } }
    end

    assert_redirected_to configuration_production_line_url(Configuration::ProductionLine.last)
  end

  test 'should show configuration_production_line' do
    get configuration_production_line_url(@configuration_production_line)
    assert_response :success
  end

  test 'should get edit' do
    get edit_configuration_production_line_url(@configuration_production_line)
    assert_response :success
  end

  test 'should update configuration_production_line' do
    patch configuration_production_line_url(@configuration_production_line), params: { configuration_production_line: { active: @configuration_production_line.active, code: @configuration_production_line.code, configuration_area_id: @configuration_production_line.configuration_area_id, description: @configuration_production_line.description, name: @configuration_production_line.name } }
    assert_redirected_to configuration_production_line_url(@configuration_production_line)
  end

  test 'should destroy configuration_production_line' do
    assert_difference('Configuration::ProductionLine.count', -1) do
      delete configuration_production_line_url(@configuration_production_line)
    end

    assert_redirected_to configuration_production_lines_url
  end
end
