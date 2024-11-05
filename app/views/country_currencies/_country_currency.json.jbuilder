# frozen_string_literal: true

json.extract! country_currency, :id, :country_id, :currency_id, :is_primary, :created_at, :updated_at
json.url country_currency_url(country_currency, format: :json)
