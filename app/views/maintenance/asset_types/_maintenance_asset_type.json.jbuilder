# frozen_string_literal: true

json.extract! maintenance_asset_type, :id, :code, :name, :description, :status, :created_at, :updated_at
json.url maintenance_asset_type_url(maintenance_asset_type, format: :json)
