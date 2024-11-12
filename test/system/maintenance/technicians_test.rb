# frozen_string_literal: true

require 'application_system_test_case'

class Maintenance::TechniciansTest < ApplicationSystemTestCase
  setup do
    @maintenance_technician = maintenance_technicians(:one)
  end

  test 'visiting the index' do
    visit maintenance_technicians_url
    assert_selector 'h1', text: 'Technicians'
  end

  test 'should create technician' do
    visit maintenance_technicians_url
    click_on 'New technician'

    fill_in 'certification level', with: @maintenance_technician.certification_level
    fill_in 'Specialty', with: @maintenance_technician.specialty
    fill_in 'Status', with: @maintenance_technician.status
    fill_in 'User', with: @maintenance_technician.user_id
    click_on 'Create Technician'

    assert_text 'Technician was successfully created'
    click_on 'Back'
  end

  test 'should update Technician' do
    visit maintenance_technician_url(@maintenance_technician)
    click_on 'Edit this technician', match: :first

    fill_in 'certification level', with: @maintenance_technician.certification_level
    fill_in 'Specialty', with: @maintenance_technician.specialty
    fill_in 'Status', with: @maintenance_technician.status
    fill_in 'User', with: @maintenance_technician.user_id
    click_on 'Update Technician'

    assert_text 'Technician was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Technician' do
    visit maintenance_technician_url(@maintenance_technician)
    click_on 'Destroy this technician', match: :first

    assert_text 'Technician was successfully destroyed'
  end
end
