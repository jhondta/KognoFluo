# frozen_string_literal: true

require 'test_helper'

class Organization::PlantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization_plant = create(:organization_plant)
    sign_in shared_user
  end

  test 'should get index' do
    get organization_plants_url
    assert_response :success
  end

  test 'should get new' do
    get new_organization_plant_url
    assert_response :success
  end

  test 'should create organization_plant' do
    assert_difference('Organization::Plant.count') do
      post organization_plants_url, params: { organization_plant: { address: @organization_plant.address, code: @organization_plant.code, name: @organization_plant.name, status: @organization_plant.status } }
    end

    assert_redirected_to organization_plant_url(Organization::Plant.last)
  end

  test 'should show organization_plant' do
    get organization_plant_url(@organization_plant)
    assert_response :success
  end

  test 'should get edit' do
    get edit_organization_plant_url(@organization_plant)
    assert_response :success
  end

  test 'should update organization_plant' do
    patch organization_plant_url(@organization_plant), params: { organization_plant: { address: @organization_plant.address, code: @organization_plant.code, name: @organization_plant.name, status: @organization_plant.status } }
    assert_redirected_to organization_plant_url(@organization_plant)
  end

  test 'should destroy organization_plant' do
    assert_difference('Organization::Plant.count', -1) do
      delete organization_plant_url(@organization_plant)
    end

    assert_redirected_to organization_plants_url
  end
end
