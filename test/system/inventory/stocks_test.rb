# frozen_string_literal: true

require 'application_system_test_case'

class Inventory::StocksTest < ApplicationSystemTestCase
  setup do
    @inventory_stock = inventory_stocks(:one)
  end

  test 'visiting the index' do
    visit inventory_stocks_url
    assert_selector 'h1', text: 'Stocks'
  end

  test 'should create stock' do
    visit inventory_stocks_url
    click_on 'New stock'

    fill_in 'Inventory item', with: @inventory_stock.inventory_item_id
    fill_in 'Inventory warehouse', with: @inventory_stock.inventory_warehouse_id
    fill_in 'Maximum', with: @inventory_stock.maximum
    fill_in 'Minimum', with: @inventory_stock.minimum
    fill_in 'Quantity', with: @inventory_stock.quantity
    fill_in 'Reorder quantity', with: @inventory_stock.reorder_quantity
    click_on 'Create Stock'

    assert_text 'Stock was successfully created'
    click_on 'Back'
  end

  test 'should update Stock' do
    visit inventory_stock_url(@inventory_stock)
    click_on 'Edit this stock', match: :first

    fill_in 'Inventory item', with: @inventory_stock.inventory_item_id
    fill_in 'Inventory warehouse', with: @inventory_stock.inventory_warehouse_id
    fill_in 'Maximum', with: @inventory_stock.maximum
    fill_in 'Minimum', with: @inventory_stock.minimum
    fill_in 'Quantity', with: @inventory_stock.quantity
    fill_in 'Reorder quantity', with: @inventory_stock.reorder_quantity
    click_on 'Update Stock'

    assert_text 'Stock was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Stock' do
    visit inventory_stock_url(@inventory_stock)
    click_on 'Destroy this stock', match: :first

    assert_text 'Stock was successfully destroyed'
  end
end
