# frozen_string_literal: true

require 'application_system_test_case'

class Inventory::CategoriesTest < ApplicationSystemTestCase
  setup do
    @inventory_category = inventory_categories(:one)
  end

  test 'visiting the index' do
    visit inventory_categories_url
    assert_selector 'h1', text: 'Categories'
  end

  test 'should create category' do
    visit inventory_categories_url
    click_on 'New category'

    fill_in 'Description', with: @inventory_category.description
    fill_in 'Name', with: @inventory_category.name
    click_on 'Create Category'

    assert_text 'Category was successfully created'
    click_on 'Back'
  end

  test 'should update Category' do
    visit inventory_category_url(@inventory_category)
    click_on 'Edit this category', match: :first

    fill_in 'Description', with: @inventory_category.description
    fill_in 'Name', with: @inventory_category.name
    click_on 'Update Category'

    assert_text 'Category was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Category' do
    visit inventory_category_url(@inventory_category)
    click_on 'Destroy this category', match: :first

    assert_text 'Category was successfully destroyed'
  end
end
