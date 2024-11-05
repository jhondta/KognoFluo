# frozen_string_literal: true

require 'test_helper'

class Inventory::ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inventory_item = inventory_items(:one)
  end

  test 'should get index' do
    get inventory_items_url
    assert_response :success
  end

  test 'should get new' do
    get new_inventory_item_url
    assert_response :success
  end

  test 'should create inventory_item' do
    assert_difference('Inventory::Item.count') do
      post inventory_items_url, params: { inventory_item: { description: @inventory_item.description, measure_unit_id: @inventory_item.measure_unit_id, name: @inventory_item.name, sku: @inventory_item.sku } }
    end

    assert_redirected_to inventory_item_url(Inventory::Item.last)
  end

  test 'should show inventory_item' do
    get inventory_item_url(@inventory_item)
    assert_response :success
  end

  test 'should get edit' do
    get edit_inventory_item_url(@inventory_item)
    assert_response :success
  end

  test 'should update inventory_item' do
    patch inventory_item_url(@inventory_item), params: { inventory_item: { description: @inventory_item.description, measure_unit_id: @inventory_item.measure_unit_id, name: @inventory_item.name, sku: @inventory_item.sku } }
    assert_redirected_to inventory_item_url(@inventory_item)
  end

  test 'should destroy inventory_item' do
    assert_difference('Inventory::Item.count', -1) do
      delete inventory_item_url(@inventory_item)
    end

    assert_redirected_to inventory_items_url
  end
end
