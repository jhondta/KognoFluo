# frozen_string_literal: true

require 'test_helper'

class Inventory::StocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inventory_stock = inventory_stocks(:one)
  end

  test 'should get index' do
    get inventory_stocks_url
    assert_response :success
  end

  test 'should get new' do
    get new_inventory_stock_url
    assert_response :success
  end

  test 'should create inventory_stock' do
    assert_difference('Inventory::Stock.count') do
      post inventory_stocks_url, params: { inventory_stock: { inventory_item_id: @inventory_stock.inventory_item_id, inventory_warehouse_id: @inventory_stock.inventory_warehouse_id, maximum: @inventory_stock.maximum, minimum: @inventory_stock.minimum, quantity: @inventory_stock.quantity, reorder_quantity: @inventory_stock.reorder_quantity } }
    end

    assert_redirected_to inventory_stock_url(Inventory::Stock.last)
  end

  test 'should show inventory_stock' do
    get inventory_stock_url(@inventory_stock)
    assert_response :success
  end

  test 'should get edit' do
    get edit_inventory_stock_url(@inventory_stock)
    assert_response :success
  end

  test 'should update inventory_stock' do
    patch inventory_stock_url(@inventory_stock), params: { inventory_stock: { inventory_item_id: @inventory_stock.inventory_item_id, inventory_warehouse_id: @inventory_stock.inventory_warehouse_id, maximum: @inventory_stock.maximum, minimum: @inventory_stock.minimum, quantity: @inventory_stock.quantity, reorder_quantity: @inventory_stock.reorder_quantity } }
    assert_redirected_to inventory_stock_url(@inventory_stock)
  end

  test 'should destroy inventory_stock' do
    assert_difference('Inventory::Stock.count', -1) do
      delete inventory_stock_url(@inventory_stock)
    end

    assert_redirected_to inventory_stocks_url
  end
end
