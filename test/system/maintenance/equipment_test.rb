# frozen_string_literal: true

require 'application_system_test_case'

class Maintenance::EquipmentTest < ApplicationSystemTestCase
  setup do
    @maintenance_equipment = maintenance_equipment(:one)
  end

  test 'visiting the index' do
    visit maintenance_equipment_url
    assert_selector 'h1', text: 'Equipment'
  end

  test 'should create equipment' do
    visit maintenance_equipment_url
    click_on 'New equipment'

    fill_in 'Description', with: @maintenance_equipment.description
    fill_in 'Location', with: @maintenance_equipment.location
    fill_in 'Name', with: @maintenance_equipment.name
    fill_in 'Status', with: @maintenance_equipment.status
    click_on 'Create Equipment'

    assert_text 'Equipment was successfully created'
    click_on 'Back'
  end

  test 'should update Equipment' do
    visit maintenance_equipment_url(@maintenance_equipment)
    click_on 'Edit this equipment', match: :first

    fill_in 'Description', with: @maintenance_equipment.description
    fill_in 'Location', with: @maintenance_equipment.location
    fill_in 'Name', with: @maintenance_equipment.name
    fill_in 'Status', with: @maintenance_equipment.status
    click_on 'Update Equipment'

    assert_text 'Equipment was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Equipment' do
    visit maintenance_equipment_url(@maintenance_equipment)
    click_on 'Destroy this equipment', match: :first

    assert_text 'Equipment was successfully destroyed'
  end
end
