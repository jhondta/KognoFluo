# frozen_string_literal: true

json.array! @country_languages, partial: 'country_languages/country_language', as: :country_language
