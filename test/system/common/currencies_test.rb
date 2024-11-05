# frozen_string_literal: true

require 'application_system_test_case'

class Common::CurrenciesTest < ApplicationSystemTestCase
  setup do
    @common_currency = create(:common_currency)
  end

  test 'visiting the index' do
    visit common_currencies_url
    assert_selector 'h1', text: 'Currencies'
  end

  test 'should create currency' do
    visit common_currencies_url
    click_on 'New currency'

    fill_in 'Code alpha', with: @common_currency.code_alpha
    fill_in 'Code numeric', with: @common_currency.code_numeric
    fill_in 'Name', with: @common_currency.name
    fill_in 'Symbol', with: @common_currency.symbol
    click_on 'Create Currency'

    assert_text 'Currency was successfully created'
    click_on 'Back'
  end

  test 'should update Currency' do
    visit common_currency_url(@common_currency)
    click_on 'Edit this currency', match: :first

    fill_in 'Code alpha', with: @common_currency.code_alpha
    fill_in 'Code numeric', with: @common_currency.code_numeric
    fill_in 'Name', with: @common_currency.name
    fill_in 'Symbol', with: @common_currency.symbol
    click_on 'Update Currency'

    assert_text 'Currency was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Currency' do
    visit common_currency_url(@common_currency)
    click_on 'Destroy this currency', match: :first

    assert_text 'Currency was successfully destroyed'
  end
end
