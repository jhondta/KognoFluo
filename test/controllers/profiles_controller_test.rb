# frozen_string_literal: true

require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile = create(:profile)
    sign_in shared_user
  end

  test 'should get index' do
    get profiles_url
    assert_response :success
  end

  test 'should get new' do
    get new_profile_url
    assert_response :success
  end

  test 'should create profile' do
    assert_difference('Profile.count') do
      post profiles_url, params: { profile: { birth_date: @profile.birth_date, first_name: @profile.first_name, gender: @profile.gender, last_name: @profile.last_name, user_id: @profile.user_id } }
    end

    assert_redirected_to profile_url(Profile.last)
  end

  test 'should show profile' do
    get profile_url(@profile)
    assert_response :success
  end

  test 'should get edit' do
    get edit_profile_url(@profile)
    assert_response :success
  end

  test 'should update profile' do
    patch profile_url(@profile), params: { profile: { birth_date: @profile.birth_date, first_name: @profile.first_name, gender: @profile.gender, last_name: @profile.last_name, user_id: @profile.user_id } }
    assert_redirected_to user_profile_url(@user_profile)
  end

  test 'should destroy user_profile' do
    assert_difference('Profile.count', -1) do
      delete user_profile_url(@user_profile)
    end

    assert_redirected_to user_profiles_url
  end
end
