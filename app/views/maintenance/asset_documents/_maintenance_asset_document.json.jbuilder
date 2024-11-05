# frozen_string_literal: true

json.extract! maintenance_asset_document, :id, :maintenance_asset_id, :document_type, :name, :description, :version, :expiration_date, :active, :created_at, :updated_at
json.url maintenance_asset_document_url(maintenance_asset_document, format: :json)
