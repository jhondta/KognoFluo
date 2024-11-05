# frozen_string_literal: true

require 'application_system_test_case'

class Organization::PlantsTest < ApplicationSystemTestCase
  setup do
    @organization_plant = create(:organization_plant)
  end

  test 'visiting the index' do
    visit organization_plants_url
    assert_selector 'h1', text: 'Plants'
  end

  test 'should create plant' do
    visit organization_plants_url
    click_on 'New plant'

    fill_in 'Address', with: @organization_plant.address
    fill_in 'Code', with: @organization_plant.code
    fill_in 'Name', with: @organization_plant.name
    fill_in 'Status', with: @organization_plant.status
    click_on 'Create Plant'

    assert_text 'Plant was successfully created'
    click_on 'Back'
  end

  test 'should update Plant' do
    visit organization_plant_url(@organization_plant)
    click_on 'Edit this plant', match: :first

    fill_in 'Address', with: @organization_plant.address
    fill_in 'Code', with: @organization_plant.code
    fill_in 'Name', with: @organization_plant.name
    fill_in 'Status', with: @organization_plant.status
    click_on 'Update Plant'

    assert_text 'Plant was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Plant' do
    visit organization_plant_url(@organization_plant)
    click_on 'Destroy this plant', match: :first

    assert_text 'Plant was successfully destroyed'
  end
end
