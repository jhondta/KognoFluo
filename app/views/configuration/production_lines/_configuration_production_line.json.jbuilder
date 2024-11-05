# frozen_string_literal: true

json.extract! configuration_production_line, :id, :code, :name, :description, :configuration_area_id, :active, :created_at, :updated_at
json.url configuration_production_line_url(configuration_production_line, format: :json)
