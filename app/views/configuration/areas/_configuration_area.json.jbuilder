# frozen_string_literal: true

json.extract! configuration_area, :id, :code, :name, :description, :configuration_plant_id, :active, :created_at, :updated_at
json.url configuration_area_url(configuration_area, format: :json)
