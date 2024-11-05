# frozen_string_literal: true

require 'application_system_test_case'

class TimezonesTest < ApplicationSystemTestCase
  setup do
    @timezone = timezones(:one)
  end

  test 'visiting the index' do
    visit timezones_url
    assert_selector 'h1', text: 'Timezones'
  end

  test 'should create timezone' do
    visit timezones_url
    click_on 'New timezone'

    fill_in 'Gmt offset', with: @timezone.gmt_offset
    fill_in 'Name', with: @timezone.name
    click_on 'Create Timezone'

    assert_text 'Timezone was successfully created'
    click_on 'Back'
  end

  test 'should update Timezone' do
    visit timezone_url(@timezone)
    click_on 'Edit this timezone', match: :first

    fill_in 'Gmt offset', with: @timezone.gmt_offset
    fill_in 'Name', with: @timezone.name
    click_on 'Update Timezone'

    assert_text 'Timezone was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Timezone' do
    visit timezone_url(@timezone)
    click_on 'Destroy this timezone', match: :first

    assert_text 'Timezone was successfully destroyed'
  end
end
