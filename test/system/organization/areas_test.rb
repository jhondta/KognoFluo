# frozen_string_literal: true

require 'application_system_test_case'

class Organization::AreasTest < ApplicationSystemTestCase
  setup do
    @organization_area = create(:organization_area)
  end

  test 'visiting the index' do
    visit organization_areas_url
    assert_selector 'h1', text: 'Areas'
  end

  test 'should create area' do
    visit organization_areas_url
    click_on 'New area'

    fill_in 'Code', with: @organization_area.code
    fill_in 'Description', with: @organization_area.description
    fill_in 'Name', with: @organization_area.name
    fill_in 'Organization plant', with: @organization_area.organization_plant_id
    fill_in 'Status', with: @organization_area.status
    click_on 'Create Area'

    assert_text 'Area was successfully created'
    click_on 'Back'
  end

  test 'should update Area' do
    visit organization_area_url(@organization_area)
    click_on 'Edit this area', match: :first

    fill_in 'Code', with: @organization_area.code
    fill_in 'Description', with: @organization_area.description
    fill_in 'Name', with: @organization_area.name
    fill_in 'Organization plant', with: @organization_area.organization_plant_id
    fill_in 'Status', with: @organization_area.status
    click_on 'Update Area'

    assert_text 'Area was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Area' do
    visit organization_area_url(@organization_area)
    click_on 'Destroy this area', match: :first

    assert_text 'Area was successfully destroyed'
  end
end
