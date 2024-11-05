# frozen_string_literal: true

require 'test_helper'

class Inventory::CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inventory_category = inventory_categories(:one)
  end

  test 'should get index' do
    get inventory_categories_url
    assert_response :success
  end

  test 'should get new' do
    get new_inventory_category_url
    assert_response :success
  end

  test 'should create inventory_category' do
    assert_difference('Inventory::Category.count') do
      post inventory_categories_url, params: { inventory_category: { description: @inventory_category.description, name: @inventory_category.name } }
    end

    assert_redirected_to inventory_category_url(Inventory::Category.last)
  end

  test 'should show inventory_category' do
    get inventory_category_url(@inventory_category)
    assert_response :success
  end

  test 'should get edit' do
    get edit_inventory_category_url(@inventory_category)
    assert_response :success
  end

  test 'should update inventory_category' do
    patch inventory_category_url(@inventory_category), params: { inventory_category: { description: @inventory_category.description, name: @inventory_category.name } }
    assert_redirected_to inventory_category_url(@inventory_category)
  end

  test 'should destroy inventory_category' do
    assert_difference('Inventory::Category.count', -1) do
      delete inventory_category_url(@inventory_category)
    end

    assert_redirected_to inventory_categories_url
  end
end
