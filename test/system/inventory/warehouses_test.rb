# frozen_string_literal: true

require 'application_system_test_case'

class Inventory::WarehousesTest < ApplicationSystemTestCase
  setup do
    @inventory_warehouse = inventory_warehouses(:one)
  end

  test 'visiting the index' do
    visit inventory_warehouses_url
    assert_selector 'h1', text: 'Warehouses'
  end

  test 'should create warehouse' do
    visit inventory_warehouses_url
    click_on 'New warehouse'

    fill_in 'Location', with: @inventory_warehouse.location
    fill_in 'Name', with: @inventory_warehouse.name
    click_on 'Create Warehouse'

    assert_text 'Warehouse was successfully created'
    click_on 'Back'
  end

  test 'should update Warehouse' do
    visit inventory_warehouse_url(@inventory_warehouse)
    click_on 'Edit this warehouse', match: :first

    fill_in 'Location', with: @inventory_warehouse.location
    fill_in 'Name', with: @inventory_warehouse.name
    click_on 'Update Warehouse'

    assert_text 'Warehouse was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Warehouse' do
    visit inventory_warehouse_url(@inventory_warehouse)
    click_on 'Destroy this warehouse', match: :first

    assert_text 'Warehouse was successfully destroyed'
  end
end
