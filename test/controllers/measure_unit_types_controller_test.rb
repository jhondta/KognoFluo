# frozen_string_literal: true

require 'test_helper'

class MeasureUnitTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @measure_unit_type = measure_unit_types(:one)
  end

  test 'should get index' do
    get measure_unit_types_url
    assert_response :success
  end

  test 'should get new' do
    get new_measure_unit_type_url
    assert_response :success
  end

  test 'should create measure_unit_type' do
    assert_difference('MeasureUnitType.count') do
      post measure_unit_types_url, params: { measure_unit_type: { name: @measure_unit_type.name } }
    end

    assert_redirected_to measure_unit_type_url(MeasureUnitType.last)
  end

  test 'should show measure_unit_type' do
    get measure_unit_type_url(@measure_unit_type)
    assert_response :success
  end

  test 'should get edit' do
    get edit_measure_unit_type_url(@measure_unit_type)
    assert_response :success
  end

  test 'should update measure_unit_type' do
    patch measure_unit_type_url(@measure_unit_type), params: { measure_unit_type: { name: @measure_unit_type.name } }
    assert_redirected_to measure_unit_type_url(@measure_unit_type)
  end

  test 'should destroy measure_unit_type' do
    assert_difference('MeasureUnitType.count', -1) do
      delete measure_unit_type_url(@measure_unit_type)
    end

    assert_redirected_to measure_unit_types_url
  end
end
