# frozen_string_literal: true

json.extract! country_language, :id, :country_id, :language_id, :is_primary, :created_at, :updated_at
json.url country_language_url(country_language, format: :json)
