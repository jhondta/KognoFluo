# frozen_string_literal: true

require 'test_helper'

class Maintenance::TechniciansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maintenance_technician = create(:maintenance_technician)
    sign_in shared_user
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
      post maintenance_technicians_url, params: { maintenance_technician: { certification_level: @maintenance_technician.certification_level, specialty: @maintenance_technician.specialty, status: @maintenance_technician.status, user_id: @maintenance_technician.user_id } }
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
    patch maintenance_technician_url(@maintenance_technician), params: { maintenance_technician: { certification_level: @maintenance_technician.certification_level, specialty: @maintenance_technician.specialty, status: @maintenance_technician.status, user_id: @maintenance_technician.user_id } }
    assert_redirected_to maintenance_technician_url(@maintenance_technician)
  end

  test 'should destroy maintenance_technician' do
    assert_difference('Maintenance::Technician.count', -1) do
      delete maintenance_technician_url(@maintenance_technician)
    end

    assert_redirected_to maintenance_technicians_url
  end
end
