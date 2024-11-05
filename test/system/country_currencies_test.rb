# frozen_string_literal: true

require 'application_system_test_case'

class CountryCurrenciesTest < ApplicationSystemTestCase
  setup do
    @country_currency = country_currencies(:one)
  end

  test 'visiting the index' do
    visit country_currencies_url
    assert_selector 'h1', text: 'Country currencies'
  end

  test 'should create country currency' do
    visit country_currencies_url
    click_on 'New country currency'

    fill_in 'Country', with: @country_currency.country_id
    fill_in 'Currency', with: @country_currency.currency_id
    check 'Is primary' if @country_currency.is_primary
    click_on 'Create Country currency'

    assert_text 'Country currency was successfully created'
    click_on 'Back'
  end

  test 'should update Country currency' do
    visit country_currency_url(@country_currency)
    click_on 'Edit this country currency', match: :first

    fill_in 'Country', with: @country_currency.country_id
    fill_in 'Currency', with: @country_currency.currency_id
    check 'Is primary' if @country_currency.is_primary
    click_on 'Update Country currency'

    assert_text 'Country currency was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Country currency' do
    visit country_currency_url(@country_currency)
    click_on 'Destroy this country currency', match: :first

    assert_text 'Country currency was successfully destroyed'
  end
end
