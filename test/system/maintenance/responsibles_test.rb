# frozen_string_literal: true

require 'application_system_test_case'

class Maintenance::ResponsiblesTest < ApplicationSystemTestCase
  setup do
    @maintenance_responsible = maintenance_responsibles(:one)
  end

  test 'visiting the index' do
    visit maintenance_responsibles_url
    assert_selector 'h1', text: 'Responsibles'
  end

  test 'should create responsible' do
    visit maintenance_responsibles_url
    click_on 'New responsible'

    fill_in 'Speciality', with: @maintenance_responsible.speciality
    fill_in 'Status', with: @maintenance_responsible.status
    fill_in 'User', with: @maintenance_responsible.user_id
    click_on 'Create Responsible'

    assert_text 'Responsible was successfully created'
    click_on 'Back'
  end

  test 'should update Responsible' do
    visit maintenance_responsible_url(@maintenance_responsible)
    click_on 'Edit this responsible', match: :first

    fill_in 'Speciality', with: @maintenance_responsible.speciality
    fill_in 'Status', with: @maintenance_responsible.status
    fill_in 'User', with: @maintenance_responsible.user_id
    click_on 'Update Responsible'

    assert_text 'Responsible was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Responsible' do
    visit maintenance_responsible_url(@maintenance_responsible)
    click_on 'Destroy this responsible', match: :first

    assert_text 'Responsible was successfully destroyed'
  end
end
