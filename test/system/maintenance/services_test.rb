# frozen_string_literal: true

require 'application_system_test_case'

class Maintenance::ServicesTest < ApplicationSystemTestCase
  setup do
    @maintenance_service = maintenance_services(:one)
  end

  test 'visiting the index' do
    visit maintenance_services_url
    assert_selector 'h1', text: 'Services'
  end

  test 'should create service' do
    visit maintenance_services_url
    click_on 'New service'

    fill_in 'Description', with: @maintenance_service.description
    fill_in 'Maintenance frequency', with: @maintenance_service.maintenance_frequency_id
    fill_in 'Maintenance responsible', with: @maintenance_service.maintenance_responsible_id
    fill_in 'Name', with: @maintenance_service.name
    fill_in 'Resources', with: @maintenance_service.resources
    fill_in 'Scheduled date', with: @maintenance_service.scheduled_date
    fill_in 'Status', with: @maintenance_service.status
    click_on 'Create Service'

    assert_text 'Service was successfully created'
    click_on 'Back'
  end

  test 'should update Service' do
    visit maintenance_service_url(@maintenance_service)
    click_on 'Edit this service', match: :first

    fill_in 'Description', with: @maintenance_service.description
    fill_in 'Maintenance frequency', with: @maintenance_service.maintenance_frequency_id
    fill_in 'Maintenance responsible', with: @maintenance_service.maintenance_responsible_id
    fill_in 'Name', with: @maintenance_service.name
    fill_in 'Resources', with: @maintenance_service.resources
    fill_in 'Scheduled date', with: @maintenance_service.scheduled_date.to_s
    fill_in 'Status', with: @maintenance_service.status
    click_on 'Update Service'

    assert_text 'Service was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Service' do
    visit maintenance_service_url(@maintenance_service)
    click_on 'Destroy this service', match: :first

    assert_text 'Service was successfully destroyed'
  end
end
