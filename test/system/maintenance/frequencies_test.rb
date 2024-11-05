# frozen_string_literal: true

require 'application_system_test_case'

class Maintenance::FrequenciesTest < ApplicationSystemTestCase
  setup do
    @maintenance_frequency = maintenance_frequencies(:one)
  end

  test 'visiting the index' do
    visit maintenance_frequencies_url
    assert_selector 'h1', text: 'Frequencies'
  end

  test 'should create frequency' do
    visit maintenance_frequencies_url
    click_on 'New frequency'

    fill_in 'Description', with: @maintenance_frequency.description
    fill_in 'Name', with: @maintenance_frequency.name
    click_on 'Create Frequency'

    assert_text 'Frequency was successfully created'
    click_on 'Back'
  end

  test 'should update Frequency' do
    visit maintenance_frequency_url(@maintenance_frequency)
    click_on 'Edit this frequency', match: :first

    fill_in 'Description', with: @maintenance_frequency.description
    fill_in 'Name', with: @maintenance_frequency.name
    click_on 'Update Frequency'

    assert_text 'Frequency was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Frequency' do
    visit maintenance_frequency_url(@maintenance_frequency)
    click_on 'Destroy this frequency', match: :first

    assert_text 'Frequency was successfully destroyed'
  end
end
