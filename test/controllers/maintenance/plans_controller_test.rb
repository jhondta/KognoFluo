# frozen_string_literal: true

require 'test_helper'

class Maintenance::PlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maintenance_plan = create(:maintenance_plan)
    sign_in shared_user
  end

  test 'should get index' do
    get maintenance_plans_url
    assert_response :success
  end

  test 'should get new' do
    get new_maintenance_plan_url
    assert_response :success
  end

  test 'should create maintenance_plan' do
    assert_difference('Maintenance::Plan.count') do
      post maintenance_plans_url, params: { maintenance_plan: { maintenance_asset_component_id: @maintenance_plan.maintenance_asset_component_id, last_execution_date: @maintenance_plan.last_execution_date, maintenance_asset_id: @maintenance_plan.maintenance_asset_id, maintenance_plan_template_id: @maintenance_plan.maintenance_plan_template_id, next_execution_date: @maintenance_plan.next_execution_date, start_date: @maintenance_plan.start_date, status: @maintenance_plan.status } }
    end

    assert_redirected_to maintenance_plan_url(Maintenance::Plan.last)
  end

  test 'should show maintenance_plan' do
    get maintenance_plan_url(@maintenance_plan)
    assert_response :success
  end

  test 'should get edit' do
    get edit_maintenance_plan_url(@maintenance_plan)
    assert_response :success
  end

  test 'should update maintenance_plan' do
    patch maintenance_plan_url(@maintenance_plan), params: { maintenance_plan: { maintenance_asset_component_id: @maintenance_plan.maintenance_asset_component_id, last_execution_date: @maintenance_plan.last_execution_date, maintenance_asset_id: @maintenance_plan.maintenance_asset_id, maintenance_plan_template_id: @maintenance_plan.maintenance_plan_template_id, next_execution_date: @maintenance_plan.next_execution_date, start_date: @maintenance_plan.start_date, status: @maintenance_plan.status } }
    assert_redirected_to maintenance_plan_url(@maintenance_plan)
  end

  test 'should destroy maintenance_plan' do
    assert_difference('Maintenance::Plan.count', -1) do
      delete maintenance_plan_url(@maintenance_plan)
    end

    assert_redirected_to maintenance_plans_url
  end
end
