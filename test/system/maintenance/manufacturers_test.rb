# frozen_string_literal: true

require 'application_system_test_case'

class Maintenance::ManufacturersTest < ApplicationSystemTestCase
  setup do
    @maintenance_manufacturer = create(:maintenance_manufacturer)
  end

  test 'visiting the index' do
    visit maintenance_manufacturers_url
    assert_selector 'h1', text: 'Manufacturers'
  end

  test 'should create manufacturer' do
    visit maintenance_manufacturers_url
    click_on 'New manufacturer'

    fill_in 'Code', with: @maintenance_manufacturer.code
    fill_in 'Name', with: @maintenance_manufacturer.name
    fill_in 'Notes', with: @maintenance_manufacturer.notes
    fill_in 'Status', with: @maintenance_manufacturer.status
    fill_in 'Suport email', with: @maintenance_manufacturer.suport_email
    fill_in 'Support phone', with: @maintenance_manufacturer.support_phone
    fill_in 'Website', with: @maintenance_manufacturer.website
    click_on 'Create Manufacturer'

    assert_text 'Manufacturer was successfully created'
    click_on 'Back'
  end

  test 'should update Manufacturer' do
    visit maintenance_manufacturer_url(@maintenance_manufacturer)
    click_on 'Edit this manufacturer', match: :first

    fill_in 'Code', with: @maintenance_manufacturer.code
    fill_in 'Name', with: @maintenance_manufacturer.name
    fill_in 'Notes', with: @maintenance_manufacturer.notes
    fill_in 'Status', with: @maintenance_manufacturer.status
    fill_in 'Suport email', with: @maintenance_manufacturer.suport_email
    fill_in 'Support phone', with: @maintenance_manufacturer.support_phone
    fill_in 'Website', with: @maintenance_manufacturer.website
    click_on 'Update Manufacturer'

    assert_text 'Manufacturer was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Manufacturer' do
    visit maintenance_manufacturer_url(@maintenance_manufacturer)
    click_on 'Destroy this manufacturer', match: :first

    assert_text 'Manufacturer was successfully destroyed'
  end
end
