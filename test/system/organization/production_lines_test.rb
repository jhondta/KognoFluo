# frozen_string_literal: true

require 'application_system_test_case'

class Organization::ProductionLinesTest < ApplicationSystemTestCase
  setup do
    @organization_production_line = create(:organization_production_line)
  end

  test 'visiting the index' do
    visit organization_production_lines_url
    assert_selector 'h1', text: 'Production lines'
  end

  test 'should create production line' do
    visit organization_production_lines_url
    click_on 'New production line'

    fill_in 'Code', with: @organization_production_line.code
    fill_in 'Configuration area', with: @organization_production_line.configuration_area_id
    fill_in 'Description', with: @organization_production_line.description
    fill_in 'Name', with: @organization_production_line.name
    fill_in 'Status', with: @organization_production_line.status
    click_on 'Create Production line'

    assert_text 'Production line was successfully created'
    click_on 'Back'
  end

  test 'should update Production line' do
    visit organization_production_line_url(@organization_production_line)
    click_on 'Edit this production line', match: :first

    fill_in 'Code', with: @organization_production_line.code
    fill_in 'Configuration area', with: @organization_production_line.configuration_area_id
    fill_in 'Description', with: @organization_production_line.description
    fill_in 'Name', with: @organization_production_line.name
    fill_in 'Status', with: @organization_production_line.status
    click_on 'Update Production line'

    assert_text 'Production line was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Production line' do
    visit organization_production_line_url(@organization_production_line)
    click_on 'Destroy this production line', match: :first

    assert_text 'Production line was successfully destroyed'
  end
end
