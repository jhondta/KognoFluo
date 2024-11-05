# frozen_string_literal: true

require 'test_helper'

class CountryLanguagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @country_language = country_languages(:one)
  end

  test 'should get index' do
    get country_languages_url
    assert_response :success
  end

  test 'should get new' do
    get new_country_language_url
    assert_response :success
  end

  test 'should create country_language' do
    assert_difference('CountryLanguage.count') do
      post country_languages_url, params: { country_language: { country_id: @country_language.country_id, is_primary: @country_language.is_primary, language_id: @country_language.language_id } }
    end

    assert_redirected_to country_language_url(CountryLanguage.last)
  end

  test 'should show country_language' do
    get country_language_url(@country_language)
    assert_response :success
  end

  test 'should get edit' do
    get edit_country_language_url(@country_language)
    assert_response :success
  end

  test 'should update country_language' do
    patch country_language_url(@country_language), params: { country_language: { country_id: @country_language.country_id, is_primary: @country_language.is_primary, language_id: @country_language.language_id } }
    assert_redirected_to country_language_url(@country_language)
  end

  test 'should destroy country_language' do
    assert_difference('CountryLanguage.count', -1) do
      delete country_language_url(@country_language)
    end

    assert_redirected_to country_languages_url
  end
end
