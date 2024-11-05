# frozen_string_literal: true

require 'application_system_test_case'

class Common::LanguagesTest < ApplicationSystemTestCase
  setup do
    @common_language = create(:common_language)
  end

  test 'visiting the index' do
    visit common_languages_url
    assert_selector 'h1', text: 'Languages'
  end

  test 'should create language' do
    visit common_languages_url
    click_on 'New language'

    fill_in 'Code iso 639 1', with: @common_language.code_iso_639_1
    fill_in 'Code iso 639 2', with: @common_language.code_iso_639_2
    fill_in 'Name', with: @common_language.name
    fill_in 'Native name', with: @common_language.native_name
    click_on 'Create Language'

    assert_text 'Language was successfully created'
    click_on 'Back'
  end

  test 'should update Language' do
    visit common_language_url(@common_language)
    click_on 'Edit this language', match: :first

    fill_in 'Code iso 639 1', with: @common_language.code_iso_639_1
    fill_in 'Code iso 639 2', with: @common_language.code_iso_639_2
    fill_in 'Name', with: @common_language.name
    fill_in 'Native name', with: @common_language.native_name
    click_on 'Update Language'

    assert_text 'Language was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Language' do
    visit common_language_url(@common_language)
    click_on 'Destroy this language', match: :first

    assert_text 'Language was successfully destroyed'
  end
end
