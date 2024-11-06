# frozen_string_literal: true

require 'application_system_test_case'

class Maintenance::PlansTest < ApplicationSystemTestCase
  setup do
    @maintenance_plan = maintenance_plans(:one)
  end

  test 'visiting the index' do
    visit maintenance_plans_url
    assert_selector 'h1', text: 'Plans'
  end

  test 'should create plan' do
    visit maintenance_plans_url
    click_on 'New plan'

    fill_in 'Component', with: @maintenance_plan.maintenance_asset_component_id
    fill_in 'Last execution date', with: @maintenance_plan.last_execution_date
    fill_in 'Maintenance asset', with: @maintenance_plan.maintenance_asset_id
    fill_in 'Maintenance plan template', with: @maintenance_plan.maintenance_plan_template_id
    fill_in 'Next execution date', with: @maintenance_plan.next_execution_date
    fill_in 'Start date', with: @maintenance_plan.start_date
    fill_in 'Status', with: @maintenance_plan.status
    click_on 'Create Plan'

    assert_text 'Plan was successfully created'
    click_on 'Back'
  end

  test 'should update Plan' do
    visit maintenance_plan_url(@maintenance_plan)
    click_on 'Edit this plan', match: :first

    fill_in 'Component', with: @maintenance_plan.maintenance_asset_component_id
    fill_in 'Last execution date', with: @maintenance_plan.last_execution_date
    fill_in 'Maintenance asset', with: @maintenance_plan.maintenance_asset_id
    fill_in 'Maintenance plan template', with: @maintenance_plan.maintenance_plan_template_id
    fill_in 'Next execution date', with: @maintenance_plan.next_execution_date
    fill_in 'Start date', with: @maintenance_plan.start_date
    fill_in 'Status', with: @maintenance_plan.status
    click_on 'Update Plan'

    assert_text 'Plan was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Plan' do
    visit maintenance_plan_url(@maintenance_plan)
    click_on 'Destroy this plan', match: :first

    assert_text 'Plan was successfully destroyed'
  end
end
