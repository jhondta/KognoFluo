# frozen_string_literal: true

require 'test_helper'

class Maintenance::EquipmentControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maintenance_equipment = maintenance_equipment(:one)
  end

  test 'should get index' do
    get maintenance_equipment_index_url
    assert_response :success
  end

  test 'should get new' do
    get new_maintenance_equipment_url
    assert_response :success
  end

  test 'should create maintenance_equipment' do
    assert_difference('Maintenance::Equipment.count') do
      post maintenance_equipment_index_url, params: { maintenance_equipment: { description: @maintenance_equipment.description, location: @maintenance_equipment.location, name: @maintenance_equipment.name, status: @maintenance_equipment.status } }
    end

    assert_redirected_to maintenance_equipment_url(Maintenance::Equipment.last)
  end

  test 'should show maintenance_equipment' do
    get maintenance_equipment_url(@maintenance_equipment)
    assert_response :success
  end

  test 'should get edit' do
    get edit_maintenance_equipment_url(@maintenance_equipment)
    assert_response :success
  end

  test 'should update maintenance_equipment' do
    patch maintenance_equipment_url(@maintenance_equipment), params: { maintenance_equipment: { description: @maintenance_equipment.description, location: @maintenance_equipment.location, name: @maintenance_equipment.name, status: @maintenance_equipment.status } }
    assert_redirected_to maintenance_equipment_url(@maintenance_equipment)
  end

  test 'should destroy maintenance_equipment' do
    assert_difference('Maintenance::Equipment.count', -1) do
      delete maintenance_equipment_url(@maintenance_equipment)
    end

    assert_redirected_to maintenance_equipment_index_url
  end
end
