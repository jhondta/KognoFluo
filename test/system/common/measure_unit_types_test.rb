# frozen_string_literal: true

require 'application_system_test_case'

class Common::MeasureUnitTypesTest < ApplicationSystemTestCase
  setup do
    @common_measure_unit_type = create(:common_measure_unit_type)
  end

  test 'visiting the index' do
    visit common_measure_unit_types_url
    assert_selector 'h1', text: 'Measure unit types'
  end

  test 'should create measure unit type' do
    visit common_measure_unit_types_url
    click_on 'New measure unit type'

    fill_in 'Name', with: @common_measure_unit_type.name
    click_on 'Create Measure unit type'

    assert_text 'Measure unit type was successfully created'
    click_on 'Back'
  end

  test 'should update Measure unit type' do
    visit common_measure_unit_type_url(@common_measure_unit_type)
    click_on 'Edit this measure unit type', match: :first

    fill_in 'Name', with: @common_measure_unit_type.name
    click_on 'Update Measure unit type'

    assert_text 'Measure unit type was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Measure unit type' do
    visit common_measure_unit_type_url(@common_measure_unit_type)
    click_on 'Destroy this measure unit type', match: :first

    assert_text 'Measure unit type was successfully destroyed'
  end
end
