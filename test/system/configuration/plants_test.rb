# frozen_string_literal: true

require 'application_system_test_case'

class Configuration::PlantsTest < ApplicationSystemTestCase
  setup do
    @configuration_plant = configuration_plants(:one)
  end

  test 'visiting the index' do
    visit configuration_plants_url
    assert_selector 'h1', text: 'Plants'
  end

  test 'should create plant' do
    visit configuration_plants_url
    click_on 'New plant'

    check 'Active' if @configuration_plant.active
    fill_in 'Address', with: @configuration_plant.address
    fill_in 'Code', with: @configuration_plant.code
    fill_in 'Name', with: @configuration_plant.name
    click_on 'Create Plant'

    assert_text 'Plant was successfully created'
    click_on 'Back'
  end

  test 'should update Plant' do
    visit configuration_plant_url(@configuration_plant)
    click_on 'Edit this plant', match: :first

    check 'Active' if @configuration_plant.active
    fill_in 'Address', with: @configuration_plant.address
    fill_in 'Code', with: @configuration_plant.code
    fill_in 'Name', with: @configuration_plant.name
    click_on 'Update Plant'

    assert_text 'Plant was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Plant' do
    visit configuration_plant_url(@configuration_plant)
    click_on 'Destroy this plant', match: :first

    assert_text 'Plant was successfully destroyed'
  end
end
