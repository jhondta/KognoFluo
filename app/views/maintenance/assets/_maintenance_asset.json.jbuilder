# frozen_string_literal: true

json.extract! maintenance_asset,
              :code,
              :name,
              :model,
              :serial_number,
              :manufacturing_date,
              :purchase_date,
              :warranty_expiration,
              :status,
              :criticality_level,
              :technical_specs,
              :physical_location,
              :notes,
              :created_at,
              :updated_at

json.asset_type do
  json.extract! maintenance_asset.type, :code, :name, :description
end

json.production_line do
  json.extract! maintenance_asset.production_line, :code, :name, :description
  json.area do
    json.extract! maintenance_asset.area, :code, :name, :description
    json.plant do
      json.extract! maintenance_asset.plant, :code, :name
    end
  end
end

json.manufacturer do
  json.extract! maintenance_asset.manufacturer, :code, :name
end

json.url maintenance_asset_url(maintenance_asset, format: :json)
