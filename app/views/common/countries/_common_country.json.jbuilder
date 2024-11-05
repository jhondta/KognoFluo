# frozen_string_literal: true

json.extract! common_country, :id, :common_name, :official_name, :code_alpha2, :code_alpha3, :phone_code, :tld, :flag_svg, :flag_png, :created_at, :updated_at
json.url common_country_url(common_country, format: :json)
