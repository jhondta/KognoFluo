# frozen_string_literal: true

json.extract! country_timezone, :id, :country_id, :timezones_id, :is_primary, :created_at, :updated_at
json.url country_timezone_url(country_timezone, format: :json)
