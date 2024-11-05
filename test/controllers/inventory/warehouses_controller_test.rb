# frozen_string_literal: true

require 'test_helper'

class Inventory::WarehousesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inventory_warehouse = inventory_warehouses(:one)
  end

  test 'should get index' do
    get inventory_warehouses_url
    assert_response :success
  end

  test 'should get new' do
    get new_inventory_warehouse_url
    assert_response :success
  end

  test 'should create inventory_warehouse' do
    assert_difference('Inventory::Warehouse.count') do
      post inventory_warehouses_url, params: { inventory_warehouse: { location: @inventory_warehouse.location, name: @inventory_warehouse.name } }
    end

    assert_redirected_to inventory_warehouse_url(Inventory::Warehouse.last)
  end

  test 'should show inventory_warehouse' do
    get inventory_warehouse_url(@inventory_warehouse)
    assert_response :success
  end

  test 'should get edit' do
    get edit_inventory_warehouse_url(@inventory_warehouse)
    assert_response :success
  end

  test 'should update inventory_warehouse' do
    patch inventory_warehouse_url(@inventory_warehouse), params: { inventory_warehouse: { location: @inventory_warehouse.location, name: @inventory_warehouse.name } }
    assert_redirected_to inventory_warehouse_url(@inventory_warehouse)
  end

  test 'should destroy inventory_warehouse' do
    assert_difference('Inventory::Warehouse.count', -1) do
      delete inventory_warehouse_url(@inventory_warehouse)
    end

    assert_redirected_to inventory_warehouses_url
  end
end
