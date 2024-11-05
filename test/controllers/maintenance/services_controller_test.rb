# frozen_string_literal: true

require 'test_helper'

class Maintenance::ServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maintenance_service = maintenance_services(:one)
  end

  test 'should get index' do
    get maintenance_services_url
    assert_response :success
  end

  test 'should get new' do
    get new_maintenance_service_url
    assert_response :success
  end

  test 'should create maintenance_service' do
    assert_difference('Maintenance::Service.count') do
      post maintenance_services_url, params: { maintenance_service: { description: @maintenance_service.description, maintenance_frequency_id: @maintenance_service.maintenance_frequency_id, maintenance_responsible_id: @maintenance_service.maintenance_responsible_id, name: @maintenance_service.name, resources: @maintenance_service.resources, scheduled_date: @maintenance_service.scheduled_date, status: @maintenance_service.status } }
    end

    assert_redirected_to maintenance_service_url(Maintenance::Service.last)
  end

  test 'should show maintenance_service' do
    get maintenance_service_url(@maintenance_service)
    assert_response :success
  end

  test 'should get edit' do
    get edit_maintenance_service_url(@maintenance_service)
    assert_response :success
  end

  test 'should update maintenance_service' do
    patch maintenance_service_url(@maintenance_service), params: { maintenance_service: { description: @maintenance_service.description, maintenance_frequency_id: @maintenance_service.maintenance_frequency_id, maintenance_responsible_id: @maintenance_service.maintenance_responsible_id, name: @maintenance_service.name, resources: @maintenance_service.resources, scheduled_date: @maintenance_service.scheduled_date, status: @maintenance_service.status } }
    assert_redirected_to maintenance_service_url(@maintenance_service)
  end

  test 'should destroy maintenance_service' do
    assert_difference('Maintenance::Service.count', -1) do
      delete maintenance_service_url(@maintenance_service)
    end

    assert_redirected_to maintenance_services_url
  end
end
