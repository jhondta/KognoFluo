# frozen_string_literal: true

json.array! @timezones, partial: 'timezones/timezone', as: :timezone
