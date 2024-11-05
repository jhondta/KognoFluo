# frozen_string_literal: true

json.extract! user_profile, :id, :user_id, :first_name, :last_name, :date_of_birth, :country_id, :gender, :avatar, :created_at, :updated_at
json.url user_profile_url(user_profile, format: :json)
json.avatar url_for(user_profile.avatar)
