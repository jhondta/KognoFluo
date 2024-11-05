# frozen_string_literal: true

json.extract! maintenance_asset_assignee, :id, :maintenance_asset_id, :maintenance_technician_id, :created_at, :updated_at
json.url maintenance_asset_assignee_url(maintenance_asset_assignee, format: :json)
