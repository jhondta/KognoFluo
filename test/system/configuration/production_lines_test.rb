# frozen_string_literal: true

require 'application_system_test_case'

class Configuration::ProductionLinesTest < ApplicationSystemTestCase
  setup do
    @configuration_production_line = configuration_production_lines(:one)
  end

  test 'visiting the index' do
    visit configuration_production_lines_url
    assert_selector 'h1', text: 'Production lines'
  end

  test 'should create production line' do
    visit configuration_production_lines_url
    click_on 'New production line'

    check 'Active' if @configuration_production_line.active
    fill_in 'Code', with: @configuration_production_line.code
    fill_in 'Configuration area', with: @configuration_production_line.configuration_area_id
    fill_in 'Description', with: @configuration_production_line.description
    fill_in 'Name', with: @configuration_production_line.name
    click_on 'Create Production line'

    assert_text 'Production line was successfully created'
    click_on 'Back'
  end

  test 'should update Production line' do
    visit configuration_production_line_url(@configuration_production_line)
    click_on 'Edit this production line', match: :first

    check 'Active' if @configuration_production_line.active
    fill_in 'Code', with: @configuration_production_line.code
    fill_in 'Configuration area', with: @configuration_production_line.configuration_area_id
    fill_in 'Description', with: @configuration_production_line.description
    fill_in 'Name', with: @configuration_production_line.name
    click_on 'Update Production line'

    assert_text 'Production line was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Production line' do
    visit configuration_production_line_url(@configuration_production_line)
    click_on 'Destroy this production line', match: :first

    assert_text 'Production line was successfully destroyed'
  end
end
