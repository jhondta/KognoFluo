# frozen_string_literal: true

require 'test_helper'

class Maintenance::TechniciansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maintenance_technician = maintenance_technicians(:one)
  end

  test 'should get index' do
    get maintenance_technicians_url
    assert_response :success
  end

  test 'should get new' do
    get new_maintenance_technician_url
    assert_response :success
  end

  test 'should create maintenance_technician' do
    assert_difference('Maintenance::Technician.count') do
      post maintenance_technicians_url, params: { maintenance_technician: { active: @maintenance_technician.active, certificacion_level: @maintenance_technician.certificacion_level, specialty: @maintenance_technician.specialty, user_id: @maintenance_technician.user_id } }
    end

    assert_redirected_to maintenance_technician_url(Maintenance::Technician.last)
  end

  test 'should show maintenance_technician' do
    get maintenance_technician_url(@maintenance_technician)
    assert_response :success
  end

  test 'should get edit' do
    get edit_maintenance_technician_url(@maintenance_technician)
    assert_response :success
  end

  test 'should update maintenance_technician' do
    patch maintenance_technician_url(@maintenance_technician), params: { maintenance_technician: { active: @maintenance_technician.active, certificacion_level: @maintenance_technician.certificacion_level, specialty: @maintenance_technician.specialty, user_id: @maintenance_technician.user_id } }
    assert_redirected_to maintenance_technician_url(@maintenance_technician)
  end

  test 'should destroy maintenance_technician' do
    assert_difference('Maintenance::Technician.count', -1) do
      delete maintenance_technician_url(@maintenance_technician)
    end

    assert_redirected_to maintenance_technicians_url
  end
end
