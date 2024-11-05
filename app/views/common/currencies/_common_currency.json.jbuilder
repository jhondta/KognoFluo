# frozen_string_literal: true

json.extract! common_currency, :id, :name, :code_alpha, :code_numeric, :symbol, :created_at, :updated_at
json.url common_currency_url(common_currency, format: :json)
