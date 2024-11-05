# frozen_string_literal: true

require 'test_helper'

class Configuration::PlantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @configuration_plant = configuration_plants(:one)
  end

  test 'should get index' do
    get configuration_plants_url
    assert_response :success
  end

  test 'should get new' do
    get new_configuration_plant_url
    assert_response :success
  end

  test 'should create configuration_plant' do
    assert_difference('Configuration::Plant.count') do
      post configuration_plants_url, params: { configuration_plant: { active: @configuration_plant.active, address: @configuration_plant.address, code: @configuration_plant.code, name: @configuration_plant.name } }
    end

    assert_redirected_to configuration_plant_url(Configuration::Plant.last)
  end

  test 'should show configuration_plant' do
    get configuration_plant_url(@configuration_plant)
    assert_response :success
  end

  test 'should get edit' do
    get edit_configuration_plant_url(@configuration_plant)
    assert_response :success
  end

  test 'should update configuration_plant' do
    patch configuration_plant_url(@configuration_plant), params: { configuration_plant: { active: @configuration_plant.active, address: @configuration_plant.address, code: @configuration_plant.code, name: @configuration_plant.name } }
    assert_redirected_to configuration_plant_url(@configuration_plant)
  end

  test 'should destroy configuration_plant' do
    assert_difference('Configuration::Plant.count', -1) do
      delete configuration_plant_url(@configuration_plant)
    end

    assert_redirected_to configuration_plants_url
  end
end
