# frozen_string_literal: true

require 'test_helper'

class Common::MeasureUnitTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @common_measure_unit_type = create(:common_measure_unit_type)
    sign_in shared_user
  end

  test 'should get index' do
    get common_measure_unit_types_url
    assert_response :success
  end

  test 'should get new' do
    get new_common_measure_unit_type_url
    assert_response :success
  end

  test 'should create common_measure_unit_type' do
    assert_difference('Common::MeasureUnitType.count') do
      post common_measure_unit_types_url, params: { common_measure_unit_type: { name: @common_measure_unit_type.name } }
    end

    assert_redirected_to common_measure_unit_type_url(Common::MeasureUnitType.last)
  end

  test 'should show common_measure_unit_type' do
    get common_measure_unit_type_url(@common_measure_unit_type)
    assert_response :success
  end

  test 'should get edit' do
    get edit_common_measure_unit_type_url(@common_measure_unit_type)
    assert_response :success
  end

  test 'should update common_measure_unit_type' do
    patch common_measure_unit_type_url(@common_measure_unit_type), params: { common_measure_unit_type: { name: @common_measure_unit_type.name } }
    assert_redirected_to common_measure_unit_type_url(@common_measure_unit_type)
  end

  test 'should destroy common_measure_unit_type' do
    assert_difference('Common::MeasureUnitType.count', -1) do
      delete common_measure_unit_type_url(@common_measure_unit_type)
    end

    assert_redirected_to common_measure_unit_types_url
  end
end
