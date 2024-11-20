# frozen_string_literal: true

require 'test_helper'

class Common::LanguagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @common_language = create(:common_language)
    sign_in shared_user
  end

  test 'should get index' do
    get common_languages_url
    assert_response :success
  end

  test 'should get new' do
    get new_common_language_url
    assert_response :success
  end

  test 'should create common_language' do
    assert_difference('Common::Language.count') do
      post common_languages_url, params: { common_language: { code_iso_639_1: @common_language.code_iso_639_1, code_iso_639_2: @common_language.code_iso_639_2, name: @common_language.name, native_name: @common_language.native_name } }
    end

    assert_redirected_to common_language_url(Common::Language.last)
  end

  test 'should show common_language' do
    get common_language_url(@common_language)
    assert_response :success
  end

  test 'should get edit' do
    get edit_common_language_url(@common_language)
    assert_response :success
  end

  test 'should update common_language' do
    patch common_language_url(@common_language), params: { common_language: { code_iso_639_1: @common_language.code_iso_639_1, code_iso_639_2: @common_language.code_iso_639_2, name: @common_language.name, native_name: @common_language.native_name } }
    assert_redirected_to common_language_url(@common_language)
  end

  test 'should destroy common_language' do
    assert_difference('Common::Language.count', -1) do
      delete common_language_url(@common_language)
    end

    assert_redirected_to common_languages_url
  end
end
