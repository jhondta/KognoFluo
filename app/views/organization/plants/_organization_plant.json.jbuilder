# frozen_string_literal: true

json.extract! organization_plant, :id, :code, :name, :address, :status, :created_at, :updated_at
json.url organization_plant_url(organization_plant, format: :json)
