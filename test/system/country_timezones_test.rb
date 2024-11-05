# frozen_string_literal: true

require 'application_system_test_case'

class CountryTimezonesTest < ApplicationSystemTestCase
  setup do
    @country_timezone = country_timezones(:one)
  end

  test 'visiting the index' do
    visit country_timezones_url
    assert_selector 'h1', text: 'Country timezones'
  end

  test 'should create country timezone' do
    visit country_timezones_url
    click_on 'New country timezone'

    fill_in 'Country', with: @country_timezone.country_id
    check 'Is primary' if @country_timezone.is_primary
    fill_in 'Timezones', with: @country_timezone.timezones_id
    click_on 'Create Country timezone'

    assert_text 'Country timezone was successfully created'
    click_on 'Back'
  end

  test 'should update Country timezone' do
    visit country_timezone_url(@country_timezone)
    click_on 'Edit this country timezone', match: :first

    fill_in 'Country', with: @country_timezone.country_id
    check 'Is primary' if @country_timezone.is_primary
    fill_in 'Timezones', with: @country_timezone.timezones_id
    click_on 'Update Country timezone'

    assert_text 'Country timezone was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Country timezone' do
    visit country_timezone_url(@country_timezone)
    click_on 'Destroy this country timezone', match: :first

    assert_text 'Country timezone was successfully destroyed'
  end
end
