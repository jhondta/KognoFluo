# frozen_string_literal: true

require 'test_helper'

class Inventory::ItemCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inventory_item_category = inventory_item_categories(:one)
  end

  test 'should get index' do
    get inventory_item_categories_url
    assert_response :success
  end

  test 'should get new' do
    get new_inventory_item_category_url
    assert_response :success
  end

  test 'should create inventory_item_category' do
    assert_difference('Inventory::ItemCategory.count') do
      post inventory_item_categories_url, params: { inventory_item_category: { inventory_category_id: @inventory_item_category.inventory_category_id, inventory_item_id: @inventory_item_category.inventory_item_id } }
    end

    assert_redirected_to inventory_item_category_url(Inventory::ItemCategory.last)
  end

  test 'should show inventory_item_category' do
    get inventory_item_category_url(@inventory_item_category)
    assert_response :success
  end

  test 'should get edit' do
    get edit_inventory_item_category_url(@inventory_item_category)
    assert_response :success
  end

  test 'should update inventory_item_category' do
    patch inventory_item_category_url(@inventory_item_category), params: { inventory_item_category: { inventory_category_id: @inventory_item_category.inventory_category_id, inventory_item_id: @inventory_item_category.inventory_item_id } }
    assert_redirected_to inventory_item_category_url(@inventory_item_category)
  end

  test 'should destroy inventory_item_category' do
    assert_difference('Inventory::ItemCategory.count', -1) do
      delete inventory_item_category_url(@inventory_item_category)
    end

    assert_redirected_to inventory_item_categories_url
  end
end
