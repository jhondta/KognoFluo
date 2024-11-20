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

    fill_in 'Code', with: @maintenance_plan.code
    fill_in 'Criticality', with: @maintenance_plan.criticality
    fill_in 'Description', with: @maintenance_plan.description
    fill_in 'Estimated duration', with: @maintenance_plan.estimated_duration
    fill_in 'Frequency type', with: @maintenance_plan.frequency_type
    fill_in 'Frequency value', with: @maintenance_plan.frequency_value
    fill_in 'Maintenance asset component', with: @maintenance_plan.maintenance_asset_component_id
    fill_in 'Maintenance asset', with: @maintenance_plan.maintenance_asset_id
    fill_in 'Name', with: @maintenance_plan.name
    fill_in 'Plan type', with: @maintenance_plan.plan_type
    check 'Requires shutdown' if @maintenance_plan.requires_shutdown
    fill_in 'Start date', with: @maintenance_plan.start_date
    fill_in 'Status', with: @maintenance_plan.status
    click_on 'Create Plan'

    assert_text 'Plan was successfully created'
    click_on 'Back'
  end

  test 'should update Plan' do
    visit maintenance_plan_url(@maintenance_plan)
    click_on 'Edit this plan', match: :first

    fill_in 'Code', with: @maintenance_plan.code
    fill_in 'Criticality', with: @maintenance_plan.criticality
    fill_in 'Description', with: @maintenance_plan.description
    fill_in 'Estimated duration', with: @maintenance_plan.estimated_duration
    fill_in 'Frequency type', with: @maintenance_plan.frequency_type
    fill_in 'Frequency value', with: @maintenance_plan.frequency_value
    fill_in 'Maintenance asset component', with: @maintenance_plan.maintenance_asset_component_id
    fill_in 'Maintenance asset', with: @maintenance_plan.maintenance_asset_id
    fill_in 'Name', with: @maintenance_plan.name
    fill_in 'Plan type', with: @maintenance_plan.plan_type
    check 'Requires shutdown' if @maintenance_plan.requires_shutdown
    fill_in 'Start date', with: @maintenance_plan.start_date.to_s
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
