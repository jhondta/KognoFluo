# frozen_string_literal: true

require 'application_system_test_case'

class Configuration::AreasTest < ApplicationSystemTestCase
  setup do
    @configuration_area = configuration_areas(:one)
  end

  test 'visiting the index' do
    visit configuration_areas_url
    assert_selector 'h1', text: 'Areas'
  end

  test 'should create area' do
    visit configuration_areas_url
    click_on 'New area'

    check 'Active' if @configuration_area.active
    fill_in 'Code', with: @configuration_area.code
    fill_in 'Configuration plant', with: @configuration_area.configuration_plant_id
    fill_in 'Description', with: @configuration_area.description
    fill_in 'Name', with: @configuration_area.name
    click_on 'Create Area'

    assert_text 'Area was successfully created'
    click_on 'Back'
  end

  test 'should update Area' do
    visit configuration_area_url(@configuration_area)
    click_on 'Edit this area', match: :first

    check 'Active' if @configuration_area.active
    fill_in 'Code', with: @configuration_area.code
    fill_in 'Configuration plant', with: @configuration_area.configuration_plant_id
    fill_in 'Description', with: @configuration_area.description
    fill_in 'Name', with: @configuration_area.name
    click_on 'Update Area'

    assert_text 'Area was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Area' do
    visit configuration_area_url(@configuration_area)
    click_on 'Destroy this area', match: :first

    assert_text 'Area was successfully destroyed'
  end
end
