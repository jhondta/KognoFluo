# frozen_string_literal: true

json.extract! profile, :id, :user_id, :first_name, :last_name, :birth_date, :gender, :avatar, :created_at, :updated_at
json.url profile_url(profile, format: :json)
json.avatar url_for(profile.avatar)
