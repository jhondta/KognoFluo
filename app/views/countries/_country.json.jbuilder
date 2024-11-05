# frozen_string_literal: true

json.extract! country, :id, :common_name, :official_name, :iso_code2, :iso_code3, :phone_code, :tld, :flag_svg, :flag_png, :created_at, :updated_at
json.url country_url(country, format: :json)
