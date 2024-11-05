# frozen_string_literal: true

json.array! @country_currencies, partial: 'country_currencies/country_currency', as: :country_currency
