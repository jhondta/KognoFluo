# frozen_string_literal: true

require 'application_system_test_case'

class Inventory::ItemsTest < ApplicationSystemTestCase
  setup do
    @inventory_item = inventory_items(:one)
  end

  test 'visiting the index' do
    visit inventory_items_url
    assert_selector 'h1', text: 'Items'
  end

  test 'should create item' do
    visit inventory_items_url
    click_on 'New item'

    fill_in 'Description', with: @inventory_item.description
    fill_in 'Measure unit', with: @inventory_item.measure_unit_id
    fill_in 'Name', with: @inventory_item.name
    fill_in 'Sku', with: @inventory_item.sku
    click_on 'Create Item'

    assert_text 'Item was successfully created'
    click_on 'Back'
  end

  test 'should update Item' do
    visit inventory_item_url(@inventory_item)
    click_on 'Edit this item', match: :first

    fill_in 'Description', with: @inventory_item.description
    fill_in 'Measure unit', with: @inventory_item.measure_unit_id
    fill_in 'Name', with: @inventory_item.name
    fill_in 'Sku', with: @inventory_item.sku
    click_on 'Update Item'

    assert_text 'Item was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Item' do
    visit inventory_item_url(@inventory_item)
    click_on 'Destroy this item', match: :first

    assert_text 'Item was successfully destroyed'
  end
end
