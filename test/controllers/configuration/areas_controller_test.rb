# frozen_string_literal: true

require 'test_helper'

class Configuration::AreasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @configuration_area = configuration_areas(:one)
  end

  test 'should get index' do
    get configuration_areas_url
    assert_response :success
  end

  test 'should get new' do
    get new_configuration_area_url
    assert_response :success
  end

  test 'should create configuration_area' do
    assert_difference('Configuration::Area.count') do
      post configuration_areas_url, params: { configuration_area: { active: @configuration_area.active, code: @configuration_area.code, configuration_plant_id: @configuration_area.configuration_plant_id, description: @configuration_area.description, name: @configuration_area.name } }
    end

    assert_redirected_to configuration_area_url(Configuration::Area.last)
  end

  test 'should show configuration_area' do
    get configuration_area_url(@configuration_area)
    assert_response :success
  end

  test 'should get edit' do
    get edit_configuration_area_url(@configuration_area)
    assert_response :success
  end

  test 'should update configuration_area' do
    patch configuration_area_url(@configuration_area), params: { configuration_area: { active: @configuration_area.active, code: @configuration_area.code, configuration_plant_id: @configuration_area.configuration_plant_id, description: @configuration_area.description, name: @configuration_area.name } }
    assert_redirected_to configuration_area_url(@configuration_area)
  end

  test 'should destroy configuration_area' do
    assert_difference('Configuration::Area.count', -1) do
      delete configuration_area_url(@configuration_area)
    end

    assert_redirected_to configuration_areas_url
  end
end
