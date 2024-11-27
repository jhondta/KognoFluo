# frozen_string_literal: true

require 'application_system_test_case'

class ProfilesTest < ApplicationSystemTestCase
  setup do
    @profile = create(:profile)
  end

  test 'visiting the index' do
    visit profiles_url
    assert_selector 'h1', text: 'User profiles'
  end

  test 'should create user profile' do
    visit profiles_url
    click_on 'New user profile'

    fill_in 'Birth date', with: @profile.birth_date
    fill_in 'First name', with: @profile.first_name
    fill_in 'Gender', with: @profile.gender
    fill_in 'Last name', with: @profile.last_name
    fill_in 'User', with: @profile.user_id
    click_on 'Create User profile'

    assert_text 'User profile was successfully created'
    click_on 'Back'
  end

  test 'should update User profile' do
    visit profile_url(@profile)
    click_on 'Edit this user profile', match: :first

    fill_in 'Birth date', with: @profile.birth_date
    fill_in 'First name', with: @profile.first_name
    fill_in 'Gender', with: @profile.gender
    fill_in 'Last name', with: @profile.last_name
    fill_in 'User', with: @profile.user_id
    click_on 'Update User profile'

    assert_text 'User profile was successfully updated'
    click_on 'Back'
  end

  test 'should destroy User profile' do
    visit profile_url(@profile)
    click_on 'Destroy this user profile', match: :first

    assert_text 'User profile was successfully destroyed'
  end
end
