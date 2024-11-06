# frozen_string_literal: true

require 'application_system_test_case'

class Common::MeasureUnitsTest < ApplicationSystemTestCase
  setup do
    @common_measure_unit = create(:common_measure_unit)
  end

  test 'visiting the index' do
    visit common_measure_units_url
    assert_selector 'h1', text: 'Measure units'
  end

  test 'should create measure unit' do
    visit common_measure_units_url
    click_on 'New measure unit'

    fill_in 'Abbreviation', with: @common_measure_unit.abbreviation
    fill_in 'Common measure unit type', with: @common_measure_unit.common_measure_unit_type_id
    fill_in 'Name', with: @common_measure_unit.name
    click_on 'Create Measure unit'

    assert_text 'Measure unit was successfully created'
    click_on 'Back'
  end

  test 'should update Measure unit' do
    visit common_measure_unit_url(@common_measure_unit)
    click_on 'Edit this measure unit', match: :first

    fill_in 'Abbreviation', with: @common_measure_unit.abbreviation
    fill_in 'Common measure unit type', with: @common_measure_unit.common_measure_unit_type_id
    fill_in 'Name', with: @common_measure_unit.name
    click_on 'Update Measure unit'

    assert_text 'Measure unit was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Measure unit' do
    visit common_measure_unit_url(@common_measure_unit)
    click_on 'Destroy this measure unit', match: :first

    assert_text 'Measure unit was successfully destroyed'
  end
end
