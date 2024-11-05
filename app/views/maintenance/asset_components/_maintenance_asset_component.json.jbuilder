# frozen_string_literal: true

json.extract! maintenance_asset_component, :id, :maintenance_asset_id, :name, :description, :quantity, :specifications, :replacement_period, :active, :created_at, :updated_at
json.url maintenance_asset_component_url(maintenance_asset_component, format: :json)
