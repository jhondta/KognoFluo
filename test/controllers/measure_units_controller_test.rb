# frozen_string_literal: true

require 'test_helper'

class MeasureUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @measure_unit = measure_units(:one)
  end

  test 'should get index' do
    get measure_units_url
    assert_response :success
  end

  test 'should get new' do
    get new_measure_unit_url
    assert_response :success
  end

  test 'should create measure_unit' do
    assert_difference('MeasureUnit.count') do
      post measure_units_url, params: { measure_unit: { abbreviation: @measure_unit.abbreviation, measure_unit_type_id: @measure_unit.measure_unit_type_id, name: @measure_unit.name } }
    end

    assert_redirected_to measure_unit_url(MeasureUnit.last)
  end

  test 'should show measure_unit' do
    get measure_unit_url(@measure_unit)
    assert_response :success
  end

  test 'should get edit' do
    get edit_measure_unit_url(@measure_unit)
    assert_response :success
  end

  test 'should update measure_unit' do
    patch measure_unit_url(@measure_unit), params: { measure_unit: { abbreviation: @measure_unit.abbreviation, measure_unit_type_id: @measure_unit.measure_unit_type_id, name: @measure_unit.name } }
    assert_redirected_to measure_unit_url(@measure_unit)
  end

  test 'should destroy measure_unit' do
    assert_difference('MeasureUnit.count', -1) do
      delete measure_unit_url(@measure_unit)
    end

    assert_redirected_to measure_units_url
  end
end
