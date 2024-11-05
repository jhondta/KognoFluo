# frozen_string_literal: true

json.array! @user_profiles, partial: 'user_profiles/user_profile', as: :user_profile
