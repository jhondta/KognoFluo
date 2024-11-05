# frozen_string_literal: true

require 'test_helper'

class Maintenance::ResponsiblesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maintenance_responsible = maintenance_responsibles(:one)
  end

  test 'should get index' do
    get maintenance_responsibles_url
    assert_response :success
  end

  test 'should get new' do
    get new_maintenance_responsible_url
    assert_response :success
  end

  test 'should create maintenance_responsible' do
    assert_difference('Maintenance::Responsible.count') do
      post maintenance_responsibles_url, params: { maintenance_responsible: { speciality: @maintenance_responsible.speciality, status: @maintenance_responsible.status, user_id: @maintenance_responsible.user_id } }
    end

    assert_redirected_to maintenance_responsible_url(Maintenance::Responsible.last)
  end

  test 'should show maintenance_responsible' do
    get maintenance_responsible_url(@maintenance_responsible)
    assert_response :success
  end

  test 'should get edit' do
    get edit_maintenance_responsible_url(@maintenance_responsible)
    assert_response :success
  end

  test 'should update maintenance_responsible' do
    patch maintenance_responsible_url(@maintenance_responsible), params: { maintenance_responsible: { speciality: @maintenance_responsible.speciality, status: @maintenance_responsible.status, user_id: @maintenance_responsible.user_id } }
    assert_redirected_to maintenance_responsible_url(@maintenance_responsible)
  end

  test 'should destroy maintenance_responsible' do
    assert_difference('Maintenance::Responsible.count', -1) do
      delete maintenance_responsible_url(@maintenance_responsible)
    end

    assert_redirected_to maintenance_responsibles_url
  end
end
