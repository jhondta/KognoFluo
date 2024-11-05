# frozen_string_literal: true

json.extract! organization_area, :id, :code, :name, :description, :organization_plant_id, :status, :created_at, :updated_at
json.url organization_area_url(organization_area, format: :json)
