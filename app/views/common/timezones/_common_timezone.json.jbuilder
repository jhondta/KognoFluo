# frozen_string_literal: true

json.extract! common_timezone, :id, :name, :gmt_offset, :created_at, :updated_at
json.url common_timezone_url(common_timezone, format: :json)
