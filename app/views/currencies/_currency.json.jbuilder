# frozen_string_literal: true

json.extract! currency, :id, :name, :iso_code, :symbol, :created_at, :updated_at
json.url currency_url(currency, format: :json)
