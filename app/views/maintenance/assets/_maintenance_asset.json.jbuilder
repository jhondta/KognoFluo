# frozen_string_literal: true

json.extract! maintenance_asset, :id, :code, :name, :maintenance_asset_type_id, :configuration_area_id, :maintenance_manufacturer_id, :model, :serial_number, :manufacturing_date, :purchase_date, :warranty_expiration, :status, :criticality_level, :technical_specs, :operation_conditions, :physical_location, :notes, :created_at, :updated_at
json.url maintenance_asset_url(maintenance_asset, format: :json)
