# frozen_string_literal: true

json.extract! organization_production_line, :id, :code, :name, :description, :organization_area_id, :status, :created_at, :updated_at
json.url organization_production_line_url(organization_production_line, format: :json)
