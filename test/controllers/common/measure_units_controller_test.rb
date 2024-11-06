# frozen_string_literal: true

require 'test_helper'

class Common::MeasureUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @common_measure_unit = create(:common_measure_unit)
  end

  test 'should get index' do
    get common_measure_units_url
    assert_response :success
  end

  test 'should get new' do
    get new_common_measure_unit_url
    assert_response :success
  end

  test 'should create common_measure_unit' do
    assert_difference('Common::MeasureUnit.count') do
      post common_measure_units_url, params: { common_measure_unit: { abbreviation: @common_measure_unit.abbreviation, common_measure_unit_type_id: @common_measure_unit.common_measure_unit_type_id, name: @common_measure_unit.name } }
    end

    assert_redirected_to common_measure_unit_url(Common::MeasureUnit.last)
  end

  test 'should show common_measure_unit' do
    get common_measure_unit_url(@common_measure_unit)
    assert_response :success
  end

  test 'should get edit' do
    get edit_common_measure_unit_url(@common_measure_unit)
    assert_response :success
  end

  test 'should update common_measure_unit' do
    patch common_measure_unit_url(@common_measure_unit), params: { common_measure_unit: { abbreviation: @common_measure_unit.abbreviation, common_measure_unit_type_id: @common_measure_unit.common_measure_unit_type_id, name: @common_measure_unit.name } }
    assert_redirected_to common_measure_unit_url(@common_measure_unit)
  end

  test 'should destroy common_measure_unit' do
    assert_difference('Common::MeasureUnit.count', -1) do
      delete common_measure_unit_url(@common_measure_unit)
    end

    assert_redirected_to common_measure_units_url
  end
end
