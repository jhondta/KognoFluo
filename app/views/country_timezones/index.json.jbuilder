# frozen_string_literal: true

json.array! @country_timezones, partial: 'country_timezones/country_timezone', as: :country_timezone
