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

json.url maintenance_asset_url(maintenance_asset, format: :json)
