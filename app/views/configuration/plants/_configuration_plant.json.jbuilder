# frozen_string_literal: true

json.extract! configuration_plant, :id, :code, :name, :address, :active, :created_at, :updated_at
json.url configuration_plant_url(configuration_plant, format: :json)
