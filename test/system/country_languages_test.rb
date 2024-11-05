# frozen_string_literal: true

require 'application_system_test_case'

class CountryLanguagesTest < ApplicationSystemTestCase
  setup do
    @country_language = country_languages(:one)
  end

  test 'visiting the index' do
    visit country_languages_url
    assert_selector 'h1', text: 'Country languages'
  end

  test 'should create country language' do
    visit country_languages_url
    click_on 'New country language'

    fill_in 'Country', with: @country_language.country_id
    check 'Is primary' if @country_language.is_primary
    fill_in 'Language', with: @country_language.language_id
    click_on 'Create Country language'

    assert_text 'Country language was successfully created'
    click_on 'Back'
  end

  test 'should update Country language' do
    visit country_language_url(@country_language)
    click_on 'Edit this country language', match: :first

    fill_in 'Country', with: @country_language.country_id
    check 'Is primary' if @country_language.is_primary
    fill_in 'Language', with: @country_language.language_id
    click_on 'Update Country language'

    assert_text 'Country language was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Country language' do
    visit country_language_url(@country_language)
    click_on 'Destroy this country language', match: :first

    assert_text 'Country language was successfully destroyed'
  end
end
