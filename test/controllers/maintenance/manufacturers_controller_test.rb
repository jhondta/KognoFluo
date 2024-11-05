# frozen_string_literal: true

require 'test_helper'

class Maintenance::ManufacturersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maintenance_manufacturer = maintenance_manufacturers(:one)
  end

  test 'should get index' do
    get maintenance_manufacturers_url
    assert_response :success
  end

  test 'should get new' do
    get new_maintenance_manufacturer_url
    assert_response :success
  end

  test 'should create maintenance_manufacturer' do
    assert_difference('Maintenance::Manufacturer.count') do
      post maintenance_manufacturers_url, params: { maintenance_manufacturer: { code: @maintenance_manufacturer.code, name: @maintenance_manufacturer.name, notes: @maintenance_manufacturer.notes, status: @maintenance_manufacturer.status, suport_email: @maintenance_manufacturer.suport_email, support_phone: @maintenance_manufacturer.support_phone, website: @maintenance_manufacturer.website } }
    end

    assert_redirected_to maintenance_manufacturer_url(Maintenance::Manufacturer.last)
  end

  test 'should show maintenance_manufacturer' do
    get maintenance_manufacturer_url(@maintenance_manufacturer)
    assert_response :success
  end

  test 'should get edit' do
    get edit_maintenance_manufacturer_url(@maintenance_manufacturer)
    assert_response :success
  end

  test 'should update maintenance_manufacturer' do
    patch maintenance_manufacturer_url(@maintenance_manufacturer), params: { maintenance_manufacturer: { code: @maintenance_manufacturer.code, name: @maintenance_manufacturer.name, notes: @maintenance_manufacturer.notes, status: @maintenance_manufacturer.status, suport_email: @maintenance_manufacturer.suport_email, support_phone: @maintenance_manufacturer.support_phone, website: @maintenance_manufacturer.website } }
    assert_redirected_to maintenance_manufacturer_url(@maintenance_manufacturer)
  end

  test 'should destroy maintenance_manufacturer' do
    assert_difference('Maintenance::Manufacturer.count', -1) do
      delete maintenance_manufacturer_url(@maintenance_manufacturer)
    end

    assert_redirected_to maintenance_manufacturers_url
  end
end
