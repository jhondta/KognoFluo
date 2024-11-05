# frozen_string_literal: true

json.extract! timezone, :id, :name, :gmt_offset, :created_at, :updated_at
json.url timezone_url(timezone, format: :json)
